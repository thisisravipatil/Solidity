pragma solidity ^0.4.17;

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
    string _productId, 
    string _owner
    ) 
    public {
        productOwners[_productId] = Ownable.ProductOwnership({
            productId: _productId,
            owner: _owner
        });
    }
    
    //Returns new owner
    function changeOwner(
    string _productId, 
    string _newOwner
    ) 
    public returns(string){
        delete productOwners[_productId];
        
        productOwners[_productId] = Ownable.ProductOwnership({
            productId: _productId,
            owner: _newOwner
        });
    }
    
    function whoOwns(string _productId) public constant returns (string){
        return productOwners[_productId].owner;
    }
    
    
}
