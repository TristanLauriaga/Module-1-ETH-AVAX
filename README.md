# ETH + AVAX Intermediate Module 1

This is my take on our Assessment on Module 1 this is a simple and original code using the logic that is needed and given the "require()" "revert()" and the "assert()" functions.

## Description

This program is written in solidity, a programming language used in web3 blockchain. And I used REMIX IDE for my online IDE compiler. A brief description on the purpose and use of my assessment. This is a Rune Calculator on the game I am playing, the player can put the amount of runes to be calculated so that they canbudget their runes throughout the game.

## Getting Started

You can run the code in the website https://remix.ethereum.org/ it is a good free and online IDE for solidity and etherium. When you get there just add the file (mycode) and then there you go you can run my code and test it out for yourself.

========================================

note that I used the version of solidity 0.8.0 this is the latest version I think.
below is the source code of my systemn.

```
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RuneCalculator {

    // State variables for Calculator
    uint256 public Remembrance;
    uint256 public Runes;
    uint256 public Levels;

    event calculate(address indexed player, string message);
    event RuneAdded(address indexed player, string runes, uint256 amount);

    // require statements

    function setLevelAmount(uint256 _amount) public {
        Levels = _amount;
        emit RuneAdded(msg.sender, "Level", _amount);
    }

    function setRuneAmount(uint256 _amount) public {
        Runes = _amount;
        emit RuneAdded(msg.sender, "Rune", _amount);
    }

    function setRemembranceAmount(uint256 _amount) public {
        Remembrance = _amount;
        emit RuneAdded(msg.sender, "Remembrance", _amount);
    }

    // assert that function of addition of all runes

    function assertTotal() public view returns (uint256) {
        assert(Remembrance + Runes + Levels > 0);
        return Remembrance + Runes + Levels;
    }

    // revert function as calculates to calculate all the given amount

    function calculates() public {
        require(Remembrance > 0 && Runes > 0 && Levels > 0, "Please enter the amount per field");
        emit calculate(msg.sender, "");
    }
}
```

This is the whole functionality of my code and the generalization of how it will run.

## Running the Code

Running the code is quite simple actually just go the deploy & run transactions and just click the orange button that says "DEPLOY". Then first things first input the 3 amounts of runes then calculate them by clicking the "assertTotal" button, then click calculate, it should have green check. Next click the remaining functions to see what you have inputed. Lastly to test if the revert function is running deploy a new contract using my contract then just click "CALCULATES" it should throw and error stating the revert function.
## Advice

Any advice can ask @ the discord with faith/Chris as my guide!

## Author

Lauriaga, Lancetristan B. @tristanaenaeee on Instagram
