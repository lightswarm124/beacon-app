const SimpleStorage = artifacts.require('./SimpleStorage.sol');

module.exports = function (deployer, accounts) {
  deployer.deploy(SimpleStorage);
}
