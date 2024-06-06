require("@nomiclabs/hardhat-waffle");

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.24",
  paths: {
    sources: "./src/contracts",
    tests: "./src/tests",
    cache: "./src/cache"
  }
};
