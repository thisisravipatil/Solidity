pragma solidity ^0.4.17;

contract RetailerRole {
    
    struct CollectProduct {
        string productId;
        string collectedOn;
    }
    //"100", "2019/01/30"
    
    struct SellProduct {
        string productId;
        string soldOn;
    }
    
    //"100", "2019/01/31"
    
    mapping(string => RetailerRole.CollectProduct) collectedProducts;
    mapping(string => RetailerRole.SellProduct) soldProducts;
    
    constructor() public {
        
    }
    
    function collectProduct(
    string _productId, 
    string _collectedOn
    ) 
    public {
        collectedProducts[_productId] = RetailerRole.CollectProduct({
            productId: _productId,
            collectedOn: _collectedOn
        });
    }
    
    function sellProduct(
    string _productId, 
    string _soldOn
    ) 
    public {
        delete collectedProducts[_productId];
        
        soldProducts[_productId] = RetailerRole.SellProduct({
            productId: _productId,
            soldOn: _soldOn
        });
    }
    
    function isInStock(string _productId) public constant returns (bool){
        if (keccak256(collectedProducts[_productId].productId ) == keccak256('')) {
            return false;
        }
        
        return true;
    }
    
    
}
