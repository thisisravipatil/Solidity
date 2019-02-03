pragma solidity >=0.5.0 <0.6.0;

import "remix_tests.sol";
import "./distributor_role.sol";

contract DistributorRoleTests {
    
    DistributorRole distributorRoleTests;

    function beforeAll () public {
        distributorRoleTests = new DistributorRole();
    }
    
    function checkCollectProductAndShipProductStatus() public {
        
        distributorRoleTests.collectProduct("100", "2019-01-30");
        distributorRoleTests.shipProduct("100", "2019-01-31");
        
        Assert.ok(distributorRoleTests.isProductShipped("100"), "Product is shipped");
    }
    
    
    
}
