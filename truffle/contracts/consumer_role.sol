pragma solidity >=0.5.0 <0.6.0;

contract ConsumerRole {
    
    struct ReceiveProduct {
        string productId;
        string receivedOn;
    }
    //"100", "2019/01/30"
    
    mapping(string => ConsumerRole.ReceiveProduct) receivedProduct;
    
    constructor() public {
        
    }
    
    function receiveProduct(
    string memory _productId, 
    string memory _receivedOn
    ) 
    public {
        receivedProduct[_productId] = ConsumerRole.ReceiveProduct({
            productId: _productId,
            receivedOn: _receivedOn
        });
    }
    
    function whenWasProductReceived(string memory _productId) public view returns (string memory){
        
        ConsumerRole.ReceiveProduct memory receivedState = receivedProduct[_productId];
        return receivedState.receivedOn;
    }
    
    function isProductReceived(string memory _productId) public view returns (bool ){
        
        if (keccak256(abi.encodePacked(receivedProduct[_productId].productId )) == keccak256(abi.encodePacked(''))) {
            return false;
        }
        
        return true;
    }
}
