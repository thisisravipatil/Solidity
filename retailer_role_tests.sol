pragma solidity ^0.4.0;

import "remix_tests.sol";
import "./RetailerRole.sol";

contract RetailerRoleTests {
    RetailerRole retailerRoleTests;
    
    function beforeAll () public {
        retailerRoleTests = new RetailerRole();
    }
    
    function checkCollectProductAndIsInStock() public {
        retailerRoleTests.collectProduct("100", "2019-01-30");
        Assert.ok(retailerRoleTests.isInStock("100"), "Currently product must be in stock");
    }
    
    function checkSellProductAndIsNotInStock() public {
        retailerRoleTests.collectProduct("100", "2019-01-30");
        retailerRoleTests.sellProduct("100", "2019-01-31");
        Assert.ok(!retailerRoleTests.isInStock("100"), "Currently product is out of stock");
    }
    
}
