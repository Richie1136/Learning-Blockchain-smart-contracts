// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

import "./SimpleStorage.sol";

// If you want a contract to inherit all the functionality of another contract you
// can just import it and say your contract is that other contract.

contract ExtraStorage is SimpleStorage {
    // How to create a child contract and inherit the functionality of some other contract,
    // we can do something called inheritance.
    // The way to inherit functionality is using the is keyword and saying our contract
    // is some other contract.
    // However, if we want to chnage from the functionality of the parent contract,
    //we have to override that function and additionally, we have to set the function
    // we want to override to virtual now we can have our own store function,
    // do whateevr we want it to do.

    // + 5
    // override
    // virtual override
    function store(uint256 _favoriteNumber) public override {
        // Add the word override to override the function
        favoriteNumber = _favoriteNumber + 5;
    }
}
