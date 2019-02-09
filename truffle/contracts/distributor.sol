pragma solidity >=0.5.0 <0.6.0;

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
    string memory _productId, 
    string memory _collectedOn
    ) 
    public {
        collectedProducts[_productId] = DistributorRole.CollectProduct({
            productId: _productId,
            collectedOn: _collectedOn
        });
    }
    
    function shipProduct(
    string memory _productId, 
    string memory _shippedOn
    ) 
    public {
        delete collectedProducts[_productId];
        
        shippedProducts[_productId] = DistributorRole.ShipProduct({
            productId: _productId,
            shippedOn: _shippedOn
        });
    }
    
    function isProductShipped(string memory _productId) public view returns (bool){
        if (keccak256(abi.encodePacked(shippedProducts[_productId].productId )) == keccak256(abi.encodePacked(''))) {
            return false;
        }
        
        return true;
    }
    
}
