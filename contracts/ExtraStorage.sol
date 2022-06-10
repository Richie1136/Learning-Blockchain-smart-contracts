// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

import "./SimpleStorage.sol";

// If you want a contract to inherit all the functionality of another contract you
// can just import it and say your contract is that other contract.

contract ExtraStorage is SimpleStorage {
    // + 5
    // override
    // virtual override
    function store(uint256 _favoriteNumber) public override {
        favoriteNumber = _favoriteNumber + 5;
    }
}
