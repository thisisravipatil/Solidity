pragma solidity ^0.4.17;

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
    string _productId, 
    string _receivedOn
    ) 
    public {
        receivedProduct[_productId] = ConsumerRole.ReceiveProduct({
            productId: _productId,
            receivedOn: _receivedOn
        });
    }
    
    function whenWasProductReceived(string _productId) public constant returns (string){
        
        ConsumerRole.ReceiveProduct receivedState = receivedProduct[_productId];
        return receivedState.receivedOn;
    }
    
    function isProductReceived(string _productId) public view returns (bool){
        
        if (keccak256(receivedProduct[_productId].productId ) == keccak256('')) {
            return false;
        }
        
        return true;
    }
}
