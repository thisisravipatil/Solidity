pragma solidity >=0.5.0 <0.6.0;

contract Laboratory {
    
    struct RawItem {
        string itemName;
        uint256 quantity; //in ml
    }
    //"Shampoo raw", "5000"
    
    struct Sample {
        string sampledItemName;
        uint series;
        uint256 quantity;
    }
    //"Shampoo raw", "50"
    
    mapping(string => Laboratory.RawItem) rawItems;
    
    mapping(string => Laboratory.Sample[]) samples;
    
    constructor() public {
        
    }
    
    function rawArrived(
    string memory _itemName, 
    uint _quantity
    ) 
    public {
        rawItems[_itemName] = Laboratory.RawItem({
            itemName: _itemName,
            quantity: _quantity
        });
    }
    
    function produceSamples(string memory _itemName, uint256 _count) public {
        Laboratory.RawItem memory rawItem = rawItems[_itemName];
        uint256 sampleQuantity = rawItem.quantity / _count;
        
        for(uint i = 0; i < _count; i++) {
            Laboratory.Sample memory sample = Laboratory.Sample({
               sampledItemName: _itemName,
               series: i,
               quantity: sampleQuantity
            });
            
            samples[_itemName].push(sample);
        }
        
    }
    
    function getSample(string memory _itemName) public view returns (string memory){
        
        Laboratory.Sample memory sample = samples[_itemName][0];
        
        return sample.sampledItemName;
    }
    
    function getSampleQuanity(string memory _itemName) public view returns (uint){
        
        Laboratory.Sample memory sample = samples[_itemName][0];
        
        return sample.quantity;
    }
}

