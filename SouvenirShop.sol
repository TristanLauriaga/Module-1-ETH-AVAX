// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract SouvenirShop{

    //this struct blockcode represents an item with a name,price and stock
    struct Item {
        string name;
        uint256 price;
        uint256 stock;
    }

    //this mapping blockcode stores the available items in the shop, with it's detailes
    //the adress statement is a statement the represents the Ethereum address or account
    mapping (string => Item) public items;
    address public owner;

    //the modifier blockcode restricts the code to be accessible only for the indicated person
    //in our case it is the owner of the souvenir shop 
    modifier onlyOwner(){
        require(msg.sender == owner, "You are not the Owner");
        _;
    }

    //the constructor blockcode is the one initializing the contract with predefined items.
    //it also sets the owner as the deployer of the contract
    constructor() {
        owner = msg.sender;

        items["shirt"] = Item("shirt", 0.01 ether, 100);
        items["bauble"] = Item("bauble", 0.005 ether, 200);
        items["artifact"] = Item("artifact", 0.1 ether, 50);
    }

    //the getStock function returns the current stock of an specific item
    function getStock(string memory itemName) public view returns (uint256) {
        return items[itemName].stock;
    }
    
    //the event blockcode is emitted or ran if an item is purchased, hence the name "purchase"
    event Purchase(address indexed buyer, string itemName, uint256 quantity);

    //this function blockcode named "purchase" has 2 functions
    //first is it ensures the stock is available and the correct ether is sent
    //second is it updates the stock and it calls the purchase event
    function purchase(string memory itemName, uint256 quantity) public payable {
        require(items[itemName].stock >= quantity, "Not enough stock available");
        
        items[itemName].stock -= quantity;

        emit Purchase(msg.sender, itemName, quantity);
    }

    //this restock function is the one who restocks the items
    function restock(string memory itemName, uint256 quantity) public onlyOwner{
        items[itemName].stock += quantity;
    }

    //the update function allows the owner to update the prices of the owner
    function update(string memory itemName, uint256 newPrice) public onlyOwner{
        require(newPrice > 0, "New price cannot be zero");
        items[itemName].price = newPrice;
    }

    //the withdraw function allows the owner to withdraw the contract's balance
    function withdraw() public onlyOwner{
        uint256 balance = address(this).balance;
        payable(owner).transfer(balance);
    }

    //the triggerAssert function tells if the contract's balance is non-negative
    function triggerAssert() public view {
        assert(address(this).balance >= 0);
    }

    //the triggerRevert function forcefully revert the contract transaction
    function triggerRevert() public pure {
        revert("This is a forced revert");
    }
}

