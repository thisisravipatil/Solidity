var consumerRole = artifacts.require("./consumer_role.sol");
var distributorRole = artifacts.require("./distributor_role.sol");
var ownableRole = artifacts.require("./ownable.sol");
var retailerRole = artifacts.require("./retailer_role.sol");
var supplyChain = artifacts.require("./supplychain_role.sol");

module.exports = function(deployer) {
   deployer.deploy(consumerRole);
   deployer.deploy(retailerRole);
   deployer.deploy(ownable);
   deployer.deploy(retailerRole);
   deployer.deploy(supplyChainRole);
};
