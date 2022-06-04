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

// View Function - Means we are just going to read state from this contract, we
// are just going to read something off of this contract

// View and pure functions disallow modification of state

// Pure functions additionally disallow you to read from blockchain state

// If you call a view function or a pure function by itself you don't need to
// spend any gas since we are just reading from the blockchain

// We only spend gas/ we only make a transaction when we modify the blockchain
// state

// If a gas calling function calls a view or pure function - only then will it
// cost gas.

// Calling view functions is free unless your calling it inside of a function
// that cost gas

// The returns keyword means what is this function going to give us after we call it

contract SimpleStorage {
    // This gets initialized to 0
    uint256 public favoriteNumber;
    // Created my first person {0: uint256: favoriteNumber 2 1:string: name Robert}
    People public person = People({favoriteNumber: 2, name: "Robert"});

    // Creating a People Array
    People[] public people;

    struct People {
        uint256 favoriteNumber;
        string name;
    }

    function store(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
    }

    function retrieve() public view returns (uint256) {
        return favoriteNumber;
    }

    // Pure function

    function add() public pure returns (uint256) {
        return (1 + 1);
    }
}
