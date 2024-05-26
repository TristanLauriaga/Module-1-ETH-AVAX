# ETH + AVAX Intermediate Module 1

This is my take on our Assessment on Module 1 this is a simple and original code using the logic that is needed and given the "require()" "revert()" and the "assert()" functions.

## Description

This program is written in solidity, a programming language used in web3 blockchain. And I used REMIX IDE for my online IDE compiler. A brief description on the purpose and use of my assessment. This is a souvineer shop system, the owner as you can see can purchase stocks, restock stocks, update or change the prices of stocks and also they can view the prices, the name of the item and lastly the remaining stocks available. Also we can see that I used the assert() function as an error handling code to see if the account has 0 or less than 0 balance if so the code will throw an error. Same goes for the revert() function, it will revert all inputs if it throws an error.

## Getting Started

You can run the code in the website https://remix.ethereum.org/ it is a good free and online IDE for solidity and etherium. When you get there just add the file (mycode) and then there you go you can run my code and test it out for yourself.

========================================

note that I used the version of solidity 0.8.26 this is the latest version I think.
below is the source code of my systemn.

```
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
```

This is the whole functionality of my code and the generalization of how it will run.

## Running the Code

Running the code is quite simple actually just go the deploy & run transactions and just click the orange button that says "DEPLOY". Then first things first Click the "Restock" function and put the item you want to restock (KEEP IN MIND THAT THERE IS ONLY 3 AVAILABLE ITEMS "SHIRTS", "BAUBLES" AND "ARTIFACTS") after that go to the "Update" Function then update the price then click the "Item" function to view the details of the Item you selected then finaly go to the "Purchase" Function. If you want to see if the stock updated just go to the "getStock" function and put the Item name you chose to alter.

## Advice

Any advice can ask @ the discord with faith/Chris as my guide!

## Author

Lauriaga, Lancetristan B. @tristanaenaeee on Instagram
