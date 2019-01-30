pragma solidity ^0.4.0;

import "remix_tests.sol";
import "./ConsumerRole.sol";

contract ConsumerRoleTests {
    
    ConsumerRole consumerRoleTests;
    
    function beforeAll () public {
        consumerRoleTests = new ConsumerRole();
    }
    
    function checkProductReceiveIsReceived() public {
        consumerRoleTests.receiveProduct("100", "2019-01-30");
        Assert.ok(consumerRoleTests.isProductReceived("100"), 
        "Product is received");
    }
}
    
