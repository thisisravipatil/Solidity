pragma solidity >=0.5.0 <0.6.0;

contract Ownable {
    
    struct ProductOwnership {
        string productId;
        string owner;
    }
    //"100", "Sherlock distributors, Seattle, Washington"
    
    mapping(string => Ownable.ProductOwnership) productOwners;
    
    constructor() public {
        
    }
    
    function ownAProduct(
    string memory _productId, 
    string memory _owner
    ) 
    public {
        productOwners[_productId] = Ownable.ProductOwnership({
            productId: _productId,
            owner: _owner
        });
    }
    
    //Returns new owner
    function changeOwner(
    string memory _productId, 
    string memory _newOwner
    ) 
    public returns(string memory ){
        delete productOwners[_productId];
        
        productOwners[_productId] = Ownable.ProductOwnership({
            productId: _productId,
            owner: _newOwner
        });
    }
    
    function whoOwns(string memory  _productId) public view returns (string memory ){
        return productOwners[_productId].owner;
    }
    
    
}
