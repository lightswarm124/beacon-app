const SimpleStorage = artifacts.require('./SimpleStorage.sol');
const BeaconAppToken = artifacts.require('./BeaconAppToken.sol');

module.exports = function (deployer) {
  deployer.deploy(SimpleStorage);
  deployer.deploy(BeaconAppToken);
}
