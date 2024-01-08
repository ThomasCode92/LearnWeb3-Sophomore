# Decentralized Exchange

**Build your own decentralized exchange like Uniswap v1**

Most people are used to buying crypto through centralized exchanges - Binance, Coinbase, etc. Often times, we resolve to the same platforms when trading between different cryptocurrencies. However, centralized exchanges are rife with problems. They can get hacked and lose all their user's money, or worse yet, the company behind the exchange can close up shop and run away with all the money. This may seem extreme, but this is not fiction.<br />

The idea of a decentralized exchange is simple - allow users to trade their crypto directly on-chain through smart contracts without giving up control of their private keys. While it sounds simple, the reality is much more complicated. In short, decentralized exchanges are a beautiful piece of mathematics and software combined together. The birth of modern decentralized exchanges was primarily led by Uniswap. Not only is Uniswap the leading decentralized exchange on Ethereum, it is THE leading dApp on Ethereum in general.

## Interacting with the DEX

For this project, 2 Smart Contract are deployed on the _sepolia_ testnet:

| Contract   | Address                                    | Etherscan                                                                               |
| ---------- | ------------------------------------------ | --------------------------------------------------------------------------------------- |
| _Token_    | 0xE2df36706E1FB0f65acf5E503Fc3ea5F34197Aa9 | [view](https://sepolia.etherscan.io/address/0xE2df36706E1FB0f65acf5E503Fc3ea5F34197Aa9) |
| _Exchange_ | 0x6B5099Ed91368C9b9Ff554a3c02570e456783048 | [view](https://sepolia.etherscan.io/address/0x6B5099Ed91368C9b9Ff554a3c02570e456783048) |

To engage with the Exchange, visit the _Exchange_ contract on Sepolia Etherscan. Once there, click on the "Contract" tab. Within the Contract tab, select the "Write Contract" option. Connect your MetaMask wallet to the platform. Afterward, opt for the "_ethToTokenSwap_" function to convert a portion of your `ETH` into `TOKEN`. If you already possess `TOKEN`, you can use the "_tokenToEthSwap_" function to exchange it back for `ETH`.

## Extra information

The project is constructed with the assistance of the following resources:

- [LearnWeb3 AAM Dex](https://learnweb3.io/degrees/ethereum-developer-degree/sophomore/a-deep-dive-into-automated-market-maker-decentralized-exchanges-uniswap-v1):
  A deep dive into Automated Market Maker Decentralized Exchanges
- [LearnWeb3 tutorial](https://learnweb3.io/degrees/ethereum-developer-degree/sophomore/build-an-nft-powered-fully-on-chain-dao-to-invest-in-nft-collections-as-a-group): Comprehensive guide providing step-by-step instructions and code for project development.
- [Hardhat](https://hardhat.org/): Framework employed for Ethereum development, facilitating the creation and deployment of smart contracts.
- [Etherscan](https://etherscan.io/): Web-based block explorer that enables users to explore, analyze, and retrieve information about transactions, addresses, and smart contracts on the Ethereum blockchain.
