pragma solidity >=0.5.0 <0.6.0;pragma solidity >=0.5.0 <0.6.0;

import "remix_tests.sol";
import "./supplychain.sol";

contract SupplyChainTests {
    
    SupplyChain supplyChainTests;
    
    function beforeAll () public {
       supplyChainTests = new SupplyChain();
    }
    
    function checkSupplyChainProductTransferrable() public {
        
        supplyChainTests.createProduct("100", "ASDFNLKIWNL", "White Collared Shirt", "Bulgaria", "Cotton farm", "No pockets, Full sleeves");
        supplyChainTests.shipProduct("100", "MANUFACTURER", "DISTRIBUTOR");
        Assert.equal(keccak256(abi.encodePacked(supplyChainTests.knowProductStatus("100"))), 
        keccak256("DISTRIBUTOR"), "Currently DISTRIBUTOR must own");
    }
    
    function checkSupplyChainProductTransferrableWithReturn() public payable returns (bool) {
        
        supplyChainTests.createProduct("100", "ASDFNLKIWNL", "White Collared Shirt", "Bulgaria", "Cotton farm", "No pockets, Full sleeves");
        supplyChainTests.shipProduct("100", "MANUFACTURER", "DISTRIBUTOR");
        return keccak256(abi.encodePacked(supplyChainTests.knowProductStatus("100"))) == keccak256("DISTRIBUTOR");
    }
    
    function checkSupplyChainProductTransferrableAndNotOwnedByDifferentRole() public {
        
        supplyChainTests.createProduct("100", "ASDFNLKIWNL", "White Collared Shirt", "Bulgaria", "Cotton farm", "No pockets, Full sleeves");
        supplyChainTests.shipProduct("100", "MANUFACTURER", "DISTRIBUTOR");
        Assert.notEqual(keccak256(abi.encodePacked(supplyChainTests.knowProductStatus("100"))), 
        keccak256("RETAILER"), "Currently DISTRIBUTOR must be owning");
    }
    
}
