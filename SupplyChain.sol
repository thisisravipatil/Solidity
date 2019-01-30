pragma solidity ^0.4.17;

contract SupplyChain {
    
    struct ProductDetails {
        string productId;
        string productUpcCode;
        string productDetails;
        string origination;
        string farm;
        string miscellaneous;
    }
    //"100", "ASDFNLKIWNL", "White Collared Shirt", "Bulgaria", "Cotton farm", "No pockets, Full sleeves"
    
    struct Shipment {
        string productId;
        string shipFrom;
        string shipTo;
    }
    //"100", "MANUFACTURER", "DISTRIBUTOR"
    
    mapping(string => SupplyChain.ProductDetails) products;
    mapping(string => Shipment) productIdAvailableAt;
    
    constructor() public {
        
    }
    
    function createProduct(
    string _productId, 
    string _productUpcCode,
    string _productDetails,
    string _origination,
    string _farm,
    string _miscellaneous
    ) 
    public {
        products[_productId] = SupplyChain.ProductDetails({
            productId: _productId,
            productUpcCode: _productUpcCode,
            productDetails: _productDetails,
            origination: _origination,
            farm: _farm,
            miscellaneous: _miscellaneous
        });
        
        productIdAvailableAt[_productId] = SupplyChain.Shipment({
            productId: _productId,
            shipFrom: 'MANUFACTURER',
            shipTo: 'MANUFACTURER'
        });
    }
    
    
    function shipProduct(string _productId, string _from, string _to) public returns (bool)  {
        
        SupplyChain.Shipment currentState = productIdAvailableAt[_productId];
        
        if(keccak256(currentState.shipTo) != keccak256(_from)) {
            return false;
        }
        
        productIdAvailableAt[_productId] = SupplyChain.Shipment({
            productId: _productId,
            shipFrom: _from,
            shipTo: _to
        });
        
        return true;
    }
    
    function knowProductStatus(string _productId) public constant returns(string) {
        return productIdAvailableAt[_productId].shipTo;
    }
    
}
