# NFT Collection with a Whitelist

**Build an NFT Collection with a whitelist using Hardhat and Solidity**

Let's launch an NFT Collection named _Crypto Devs_ - where early supporters get guaranteed access to the NFT mint when it happens.<br />
To do that, a simple solution is by building a _whitelist dApp_ first and allowing early supporters to join the whitelist. Being on the whitelist will give them guaranteed access to mint the NFT once the collection launches!<br />
This will be possible by maintaining a whitelist where the first ten users who join can get in for free. Once they are on the whitelist, they can mint an NFT from the _Crypto Devs_ collection for free, while everyone else must pay to mint it!

## Deployed Contracts

Two Smart Contract are deployed on the _sepolia_ testnet:

| Contract          | Address                                    | Etherscan                                                                               |
| ----------------- | ------------------------------------------ | --------------------------------------------------------------------------------------- |
| _WhiteList_       | 0x8Dcf47cCb18129aDc1934BD5856726aBF7c83C43 | [view](https://sepolia.etherscan.io/address/0x8Dcf47cCb18129aDc1934BD5856726aBF7c83C43) |
| _Crypto Devs NFT_ | 0xC53Ae3485609d3B140693BB887adCd2b8EdD6Ad4 | [view](https://sepolia.etherscan.io/address/0xC53Ae3485609d3B140693BB887adCd2b8EdD6Ad4) |

## Extra information

Building this project, fhe following resources are used:

- LearnWeb3 tutorial, [visit web page](https://learnweb3.io/degrees/ethereum-developer-degree/sophomore/build-an-nft-collection-with-a-whitelist-using-hardhat-and-solidity/)
- [Hardhat](https://hardhat.org/) for Ethereum development
