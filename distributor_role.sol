pragma solidity ^0.4.17;

contract DistributorRole {
    
    struct CollectProduct {
        string productId;
        string collectedOn;
    }
    //"100", "2019/01/30"
    
    struct ShipProduct {
        string productId;
        string shippedOn;
    }
    
    //"100", "2019/01/31"
    
    mapping(string => DistributorRole.CollectProduct) collectedProducts;
    mapping(string => DistributorRole.ShipProduct) shippedProducts;
    
    constructor() public {
        
    }
    
    function collectProduct(
    string _productId, 
    string _collectedOn
    ) 
    public {
        collectedProducts[_productId] = DistributorRole.CollectProduct({
            productId: _productId,
            collectedOn: _collectedOn
        });
    }
    
    function shipProduct(
    string _productId, 
    string _shippedOn
    ) 
    public {
        delete collectedProducts[_productId];
        
        shippedProducts[_productId] = DistributorRole.ShipProduct({
            productId: _productId,
            shippedOn: _shippedOn
        });
    }
    
    function isProductShipped(string _productId) public constant returns (bool){
        if (keccak256(shippedProducts[_productId].productId ) == keccak256('')) {
            return false;
        }
        
        return true;
    }
    
}
