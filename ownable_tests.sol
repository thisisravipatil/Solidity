pragma solidity ^0.4.0;

import "remix_tests.sol";
import "./Ownable.sol";


contract ownableTests {
    
    Ownable ownableTests;
    
    function beforeAll () public {
       ownableTests = new Ownable();
    }
    
    function checkOwnerOfTheProductIsSetCorrect() public {
        ownableTests.ownAProduct("100", "DISTRIBUTOR1");
        Assert.equal(keccak256(ownableTests.whoOwns("100")), keccak256("DISTRIBUTOR1"), "DISTRIBUTOR1 is the correct owner");
    }
    
    function checkOwnershipTransfer() public {
        ownableTests.ownAProduct("101", "DISTRIBUTOR1");
        ownableTests.changeOwner("100", "DISTRIBUTOR2");
        Assert.equal(keccak256(ownableTests.whoOwns("100")), keccak256("DISTRIBUTOR2"), 
        "DISTRIBUTOR2 is the correct owner");
    }
    
}
