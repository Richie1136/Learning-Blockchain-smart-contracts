// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

import "./SimpleStorage.sol";

contract StorageFactory {
    SimpleStorage[] public simpleStorageArray;

    function createSimpleStorageContract() public {
        // Saving simpleStorage as a memory variable
        SimpleStorage simpleStorage = new SimpleStorage();
        // pushing the simpleStorage into the array
        simpleStorageArray.push(simpleStorage);
    }
}
