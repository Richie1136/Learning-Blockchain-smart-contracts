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

// You can store data in 6 places in solidity

// The Stack, Memory, Storage, Calldata, Code, and Logs

// Calldata and memory means that the variable is only going to exist temporarily.

// Storage variables exist, even outside of just the function executing.

// Calldata are temporary variables that can't be modified

// Memory is temporary variables that can be modified

// Storage is permanent varibles that can be modified

// Mapping - is a data structure where a key is "mapped" to a single value, easy way
// to think of it is as a dictionary

// The store and addPerson functions modify the blockchain meaning that metamask
// will pop up to confirm the transaction

// EVM, Ethereum Virtual Machine - A standard of how to deploy smart contracts to
// ethereum like blockchains

// Any blockchain that implements a type of EVM. You can deploy solidity code to.
// Some examples of EVM compatible blockchains are going to be Avalanche, Phantom, and
// Polygon. Since these are EVM compatible, this means we can write solidity code,
// and deploy to these blochains.

contract SimpleStorage {
    // This gets initialized to 0
    // Storage variable
    uint256 public favoriteNumber;

    mapping(string => uint256) public nameToFavoriteNumber;

    // Created my first person {0: uint256: favoriteNumber 2 1:string: name Robert}
    // People public person = People({favoriteNumber: 2, name: "Robert"});

    // Creating a people Array
    People[] public people;

    struct People {
        uint256 favoriteNumber;
        string name;
    }

    function store(uint256 _favoriteNumber) public virtual {
        // Add the word virtual to make this function overrideable
        favoriteNumber = _favoriteNumber;
    }

    function retrieve() public view returns (uint256) {
        return favoriteNumber;
    }

    // Pure function

    // function add() public pure returns (uint256) {
    //     return (1 + 1);
    // }

    // calldata, memory, storage

    // Name variable only exists temporarily during the transaction that this addPerson function
    // is called

    // Need to tell functions the data location for array, struct or mapping types
    function addPerson(string memory _name, uint256 favNum) public {
        // Need to add memory to strings because a string is an array which means we need to
        // add it to memory
        People memory newPerson = People({favoriteNumber: favNum, name: _name});
        // we are saying the stirng name is being mapped to the uint256 favNum
        nameToFavoriteNumber[_name] = favNum;
        // Also getting added to the people array
        people.push(newPerson);
    }
}
