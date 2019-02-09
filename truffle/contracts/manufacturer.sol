pragma solidity >=0.5.0 <0.6.0;

contract Manufacturer {
    
    struct CollectedSample {
        string itemName;
        int256 quantity; //in ml
        bool retested;
    }//"Shampoo raw", 5000, false
    
    struct Product {
        int256 serialNumber;
        string productName;
        int256 quantity;
    }//11234, "Shampoo raw", 50
    
    mapping(string => Manufacturer.CollectedSample) samples;
    
    mapping(int256 => Manufacturer.Product) products;
    
    int256 serialNumberTracker = 1;
    
    constructor() public {
        
    }
    
    function collectSample(
    string memory _itemName, 
    int256 _quantity
    ) 
    public {
        samples[_itemName] = Manufacturer.CollectedSample({
            itemName: _itemName,
            quantity: _quantity,
            retested: false
        });
    }
    
    function redoTests(
    string memory _itemName
    ) 
    public {
        Manufacturer.CollectedSample memory collectedSample = samples[_itemName];
        collectedSample.retested = true;
        samples[_itemName] = collectedSample;
    } 
    
    //Make product and return serialNumber for caller to track. -1 if not retested yet.
    function produceProducts(string memory _itemName, int256 _count) public returns (int256) {
        Manufacturer.CollectedSample memory collectedSample = samples[_itemName];

        if (collectedSample.retested) {
            Manufacturer.Product memory product = Manufacturer.Product({
               serialNumber: serialNumberTracker,
               productName: _itemName,
               quantity: _count
            });
            
            products[serialNumberTracker] = product;
            int256 result = serialNumberTracker;
            serialNumberTracker = serialNumberTracker + 1;
            return result;
        }
            
        return -1;
        
    }
    
    function shipProduct(int256 _serialNumberToShip) public returns (int256){
        
        Manufacturer.Product memory product = products[_serialNumberToShip];
        
        delete products[_serialNumberToShip];
        
        return product.serialNumber;
    }
    
    function isProductRetested(string memory _itemName) public view returns (bool){
        
        Manufacturer.CollectedSample memory sample = samples[_itemName];
        
        return sample.retested;
    }
    
    function isExist(string memory _itemName) public view returns (bool){
        
        Manufacturer.CollectedSample memory sample = samples[_itemName];
        
        if ( sample.quantity != 0) {
            return true;
        } else {
            return false;
        }
    }
}

