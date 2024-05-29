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
