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

    function storagefactoryStore(
        uint256 _simpleStorageIndex,
        uint256 _simpleStorageNumber
    ) public {
        // Address
        // ABI - Application Binary Interface. Tells you all of the inputs and
        // outputs and everything you could do with the contract
    }
}
