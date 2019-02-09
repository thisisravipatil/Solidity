var consumerRole = artifacts.require("./consumer.sol");
var distributorRole = artifacts.require("./distributor.sol");
var retailerRole = artifacts.require("./retailer.sol");
var laboratory = artifacts.require("./laboratory.sol");
var manufacturer = artifacts.require("./manufacturer.sol");
var supplyChain = artifacts.require("./supplychain.sol");

module.exports = function(deployer) {
   deployer.deploy(consumerRole);
   deployer.deploy(retailerRole);
   deployer.deploy(ownable);
   deployer.deploy(retailerRole);
   deployer.deploy(supplyChainRole);
};
