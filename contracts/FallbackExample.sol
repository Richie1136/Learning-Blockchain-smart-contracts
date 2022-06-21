// SPDX-License-Identifier: MIT

// What happens if someone sends this contract ETH without calling the fund function

// receive() - Executes on calls to contract with no data. A contract can have at most one
// receive function, declared using receive() external payable {...}  (without the function keyword).
// This function cannot have arguments, cannot return anything and must have external visibility
// and payable state mutability. It can be virtual, can override and can have modifiers.

// fallback - When no other function matches (not even the receive function). Optionally payable

// This separation provides an alternative to the fallback function for contracts
// that want to receive plain Ether.

pragma solidity ^0.8.7;

contract FallbackExample {
    uint256 public result;

    receive() external payable {
        // Don't add the function keyword because solidity knows that receive is a
        // special function
        // Whenever we sent ethereum or make a transaction to this contract, as long
        // as there's no data associated with that transaction, thus recieve function
        // will get triggered.

        result = 1;
    }

    fallback() external payable {
        result = 2;
    }
}
