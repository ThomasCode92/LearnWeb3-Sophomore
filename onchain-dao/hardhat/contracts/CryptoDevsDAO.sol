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
}
