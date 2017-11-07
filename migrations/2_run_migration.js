var StandardToken = artifacts.require("StandardToken");

module.exports = function(deployer) {
    // deployment steps
    deployer.deploy(StandardToken);
};
