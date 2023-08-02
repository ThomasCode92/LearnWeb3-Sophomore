require("@nomicfoundation/hardhat-toolbox");
const dotenv = require("dotenv");

// Load Environment variables
const { parsed } = dotenv.config();
const { PRIVATE_KEY, QUICKNODE_HTTP_URL, ETHERSCAN_API_KEY } = parsed;

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.18",
  networks: {
    sepolia: {
      url: QUICKNODE_HTTP_URL,
      accounts: [PRIVATE_KEY],
    },
  },
  etherscan: {
    apiKey: ETHERSCAN_API_KEY,
  },
};
