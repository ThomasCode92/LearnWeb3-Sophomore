// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import '@openzeppelin/contracts/access/Ownable.sol';

// Interfaces
import './interfaces/IFakeNFTMarketplace.sol';
import './interfaces/ICryptoDevsNFT.sol';

contract CryptoDevsDAO is Ownable {
    // A struct containing all relevant information about a proposal
    struct Proposal {
        // nftTokenId - the tokenID of the NFT to purchase from
        // FakeNFTMarketplace if the proposal passes
        uint256 nftTokenId;
        // deadline - the UNIX timestamp until which this proposal is active.
        // Proposal can be executed after the deadline has been exceeded.
        uint256 deadline;
        // yayVotes - number of yay votes for this proposal
        uint256 yayVotes;
        // nayVotes - number of nay votes for this proposal
        uint256 nayVotes;
        // executed - whether or not this proposal has been executed yet.
        // Cannot be executed before the deadline has been exceeded.
        bool executed;
        // voters - a mapping of CryptoDevsNFT tokenIDs to booleans indicating
        // whether that NFT has already been used to cast a vote or not
        mapping(uint256 => bool) voters;
    }

    // An enum containing possible options for a vote
    enum Vote {
        YAY, // YAY = 0
        NAY // NAY = 1
    }

    // A mapping of ID to proposal
    mapping(uint256 => Proposal) public proposals;

    // Number of proposals that have been created
    uint256 public numProposals;

    // Reference to the FakeNFTMarketplace and CryptoDevsNFT contracts
    IFakeNFTMarketplace nftMarketplace;
    ICryptoDevsNFT cryptoDevsNFT;

    // A modifier which only allows a function be
    // called by someone who owns at least 1 CryptoDevsNFT
    modifier nftHolderOnly() {
        require(cryptoDevsNFT.balanceOf(msg.sender) > 0, 'NOT_A_DAO_MEMBER');
        _;
    }

    // A modifier which only allows a function be
    // called if the given proposal's deadline has not been exceeded yet
    modifier activeProposalOnly(uint256 _proposalIndex) {
        require(
            proposals[_proposalIndex].deadline > block.timestamp,
            'DEADLINE_EXCEEDED'
        );
        _;
    }

    // A modifier which only allows a function be
    // called if the given proposal's deadline has been exceeded
    // and if the proposal has not been executed yet
    modifier inactiveProposalOnly(uint256 _proposalIndex) {
        require(
            proposals[_proposalIndex].deadline <= block.timestamp,
            'DEADLINE_NOT_EXCEEDED'
        );
        require(
            proposals[_proposalIndex].executed == false,
            'PROPOSAL_ALREADY_EXECUTED'
        );
        _;
    }

    // A payable constructor which initializes the contract
    // instances for FakeNFTMarketplace and CryptoDevsNFT
    // The payable allows this contract to accept an ETH deposit when it is being deployed
    constructor(
        address _nftMarketplace,
        address _cryptoDevsNFT
    ) payable Ownable(msg.sender) {
        nftMarketplace = IFakeNFTMarketplace(_nftMarketplace);
        cryptoDevsNFT = ICryptoDevsNFT(_cryptoDevsNFT);
    }

    /// @dev createProposal() allows a CryptoDevsNFT holder to create a new proposal in the DAO
    /// @param _nftTokenId - the tokenID of the NFT to be purchased from FakeNFTMarketplace if this proposal passes
    /// @return Returns the proposal index for the newly created proposal
    function createProposal(
        uint256 _nftTokenId
    ) external nftHolderOnly returns (uint256) {
        require(nftMarketplace.available(_nftTokenId), 'NFT_NOT_FOR_SALE');

        Proposal storage proposal = proposals[numProposals];
        proposal.nftTokenId = _nftTokenId;
        proposal.deadline = block.timestamp + 5 minutes; // Set the proposal's voting deadline to be (current time + 5 minutes)

        numProposals++;

        return numProposals - 1;
    }

    /// @dev voteOnProposal() allows a CryptoDevsNFT holder to cast their vote on an active proposal
    /// @param _proposalIndex - the index of the proposal to vote on in the proposals array
    /// @param _vote - the the of vote they want to cast (YAY or NAY)
    function voteOnProposal(
        uint256 _proposalIndex,
        Vote _vote
    ) external nftHolderOnly activeProposalOnly(_proposalIndex) {
        Proposal storage proposal = proposals[_proposalIndex];
        uint256 voterNFTBalance = cryptoDevsNFT.balanceOf(msg.sender);
        uint256 numVotes = 0;

        // Calculate how many NFTs are owned by the voter
        // that haven't already been used for voting on this proposal
        for (uint256 i = 0; i < voterNFTBalance; i++) {
            uint256 tokenId = cryptoDevsNFT.tokenOfOwnerByIndex(msg.sender, i);
            if (proposal.voters[tokenId] == false) {
                numVotes++;
                proposal.voters[tokenId] = true;
            }
        }

        require(numVotes > 0, 'ALREADY_VOTED');

        if (_vote == Vote.YAY) {
            proposal.yayVotes += numVotes;
        } else {
            proposal.nayVotes += numVotes;
        }
    }

    /// @dev executeProposal() allows any CryptoDevsNFT holder to execute a proposal after it's deadline has been exceeded
    /// @param _proposalIndex - the index of the proposal to execute in the proposals array
    function executeProposal(
        uint256 _proposalIndex
    ) external nftHolderOnly inactiveProposalOnly(_proposalIndex) {
        Proposal storage proposal = proposals[_proposalIndex];

        // If the proposal has more yay votes than nay votes, execute it
        if (proposal.yayVotes > proposal.nayVotes) {
            uint256 nftPrice = nftMarketplace.getPrice();
            require(address(this).balance >= nftPrice, 'NOT_ENOUGH_FUNDS');
            nftMarketplace.purchase{value: nftPrice}(proposal.nftTokenId);
        }

        proposal.executed = true;
    }
}
