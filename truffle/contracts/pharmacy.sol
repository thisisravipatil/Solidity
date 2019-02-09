pragma solidity >=0.5.0 <0.6.0;

contract Pharmacy {
    
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
    
    mapping(string => Pharmacy.CollectProduct) collectedProducts;
    mapping(string => Pharmacy.SellProduct) soldProducts;
    
    constructor() public {
        
    }
    
    function collectProduct(
    string memory _productId, 
    string memory _collectedOn
    ) 
    public {
        collectedProducts[_productId] = Pharmacy.CollectProduct({
            productId: _productId,
            collectedOn: _collectedOn
        });
    }
    
    function sellProduct(
    string memory _productId, 
    string memory _soldOn
    ) 
    public {
        delete collectedProducts[_productId];
        
        soldProducts[_productId] = Pharmacy.SellProduct({
            productId: _productId,
            soldOn: _soldOn
        });
    }
    
    function isInStock(string memory _productId) public view returns (bool){
        if (keccak256(abi.encodePacked(collectedProducts[_productId].productId )) == keccak256('')) {
            return false;
        }
        
        return true;
    }
    
    
}
