# NFT-powered On-chain DAO

**Build an NFT-powered fully on-chain DAO to invest in NFT collections as a group**

DAO stands for Decentralized Autonomous Organization. You can think of DAOs as analogous to companies in the real world. Essentially, DAOs allow for members to create and vote on governance decisions.<br />
In traditional companies, when a decision needs to be made, the board of directors or executives of the company are in charge of making that decision. In a DAO, however, this process is democratized, and any member can create a proposal, and all other members can vote on it. Each proposal created has a deadline for voting, and after the deadline the decision is made in favour of the voting outcome (YES or NO).<br />
Membership in DAOs is typically restricted either by ownership of ERC20 tokens, or by ownership of NFTs. Examples of DAOs where membership and voting power is proportional to how many tokens you own include [Uniswap](https://uniswap.org/) and [ENS](https://ens.domains/nl/). Examples of DAOs where they are based on NFTs include [Meebits](https://www.meebitsdao.com/) DAO.

## Running the Application

Navigate to the _frontend_ folder in your terminal and initiate the development server by executing the command `npm run dev`.<br />
This action will launch the Next.js project on localhost on port 3000.

For this project, 3 Smart Contract are deployed on the _sepolia_ testnet:

| Contract               | Address                                    | Etherscan                                                                               |
| ---------------------- | ------------------------------------------ | --------------------------------------------------------------------------------------- |
| _Crypto Devs NFT_      | 0x547DDd8dBdc5D1fB4A50918F73476BAF01ef74a2 | [view](https://sepolia.etherscan.io/address/0x547DDd8dBdc5D1fB4A50918F73476BAF01ef74a2) |
| _Fake NFT Marketplace_ | 0xD88DB09A87681d1E9Cb9D27810A892abb43308A9 | [view](https://sepolia.etherscan.io/address/0xD88DB09A87681d1E9Cb9D27810A892abb43308A9) |
| _Crypto Devs DAO_      | 0x1C2027e14c41c4079d0aE9DE0039c0c5C9310600 | [view](https://sepolia.etherscan.io/address/0x1C2027e14c41c4079d0aE9DE0039c0c5C9310600) |

To mint NFTs for use within the DAO, access the _Crypto Devs NFT_ on Sepolia Etherscan and locate the contract. In the Contract tab, choose Write Contract. Connect individual MetaMask wallets one by one, and within each connected wallet, repeatedly execute the `mint` function. This will result in the distribution of NFTs across different accounts, allowing for their participation in the DAO.

## Extra information

The project is constructed with the assistance of the following resources:

- [LearnWeb3 tutorial](https://learnweb3.io/degrees/ethereum-developer-degree/sophomore/build-an-nft-powered-fully-on-chain-dao-to-invest-in-nft-collections-as-a-group): Comprehensive guide providing step-by-step instructions and code for project development.
- [Hardhat](https://hardhat.org/): Framework employed for Ethereum development, facilitating the creation and deployment of smart contracts.
- [Next.js](https://nextjs.org/): Utilized for the frontend development, enabling the construction of dynamic and responsive web applications.
