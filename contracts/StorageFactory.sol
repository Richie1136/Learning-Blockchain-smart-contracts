// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

// how to import other contracts into our contracts and into our code using the
// import keyword.
import "./SimpleStorage.sol";

contract StorageFactory {
    SimpleStorage[] public simpleStorageArray;

    // Storage factory contract allows us to create simple storage contracts,
    // it then saves it to our simple storage array, which we can then call different
    // functions on, which we can then call different functions on, we can store
    // values from our storage factory contract. And then we can read values from
    // our storage factory contract for any of the simple storage contracts that
    // we've created.

    function createSimpleStorageContract() public {
        // Deploy contracts from other contracts using the new keyword

        // Saving simpleStorage as a memory variable
        SimpleStorage simpleStorage = new SimpleStorage();
        // pushing the simpleStorage into the array
        simpleStorageArray.push(simpleStorage);
    }

    function storagefactoryStore(
        uint256 _simpleStorageIndex,
        uint256 _simpleStorageNumber
    ) public {
        // Can interact with other contracts as long as we have the ABI and address

        // call the store function from the SimpleStorage file from inside of the StorageFactory
        // Address
        // ABI - Application Binary Interface. Tells you all of the inputs and
        // outputs and everything you could do with the contract
        simpleStorageArray[_simpleStorageIndex].store(_simpleStorageNumber);
    }

    function StorageFactoryGet(uint256 _simpleStorageIndex)
        public
        view
        returns (uint256)
    {
        // function that can read from the simple storage contract from the storage factory

        return simpleStorageArray[_simpleStorageIndex].retrieve();
        // This will get the number that is stored inside of the storagefactoryStore function
    }
}
