// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

// Basic Solidity Types

// boolean - True / False
// uint - Unsigned integer, which means its going to be a whole number, that isn't
// positive or negative, its just positive

// int - Positive or Negative whole number
// address - An address

// boolean, uint, int, address, bytes
// bool hasFavoriteNumber = true;
// uint256 favoriteNumber = 123;
// int256 favoriteNumber2 = -456;
// string favoriteNumberInText = "Apples are the best";
// address myAddress = 0x98370C5D6D3C741EAD804B70a2E734B55DB41Ffa;
// bytes32 favoriteBytes = "Cat";

contract SimpleStorage {
    // This gets initialized to 0
    uint256 favoriteNumber;

    function store(uint256 _favoriteNumber) public {}
}
