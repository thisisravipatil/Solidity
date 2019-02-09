pragma solidity >=0.5.0 <0.6.0;

contract SupplyChain {
    
    struct ProductDetails {
        string productId;
        string productUpcCode;
        string productDetails;
        string origination;
        string manufacturer;
        string otherDetails;
    }
    //"100", "ASDFNLKIWNL", "White Collared Shirt", "Bulgaria", "X manufacturer", "Only prescribed, For external use only"
    
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
    string memory _productId, 
    string memory _productUpcCode,
    string memory _productDetails,
    string memory _origination,
    string memory _manufacturer,
    string memory _otherDetails
    ) 
    public {
        products[_productId] = SupplyChain.ProductDetails({
            productId: _productId,
            productUpcCode: _productUpcCode,
            productDetails: _productDetails,
            origination: _origination,
            manufacturer: _manufacturer,
            otherDetails: _otherDetails
        });
        
        productIdAvailableAt[_productId] = SupplyChain.Shipment({
            productId: _productId,
            shipFrom: 'MANUFACTURER',
            shipTo: 'MANUFACTURER'
        });
    }
    
    
    function shipProduct(string memory _productId, string memory _from, string memory _to) public returns (bool)  {
        
        SupplyChain.Shipment memory currentState = productIdAvailableAt[_productId];
        
        if(keccak256(abi.encodePacked(currentState.shipTo)) != keccak256(abi.encodePacked(_from))) {
            return false;
        }
        
        productIdAvailableAt[_productId] = SupplyChain.Shipment({
            productId: _productId,
            shipFrom: _from,
            shipTo: _to
        });
        
        return true;
    }
    
    function knowProductStatus(string memory _productId) public view returns(string memory) {
        return productIdAvailableAt[_productId].shipTo;
    }
    
}
