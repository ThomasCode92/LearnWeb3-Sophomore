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
}
