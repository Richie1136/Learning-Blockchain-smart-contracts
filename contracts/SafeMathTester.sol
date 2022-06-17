// SPDX-License-Identifier: MIT

pragma solidity ^0.8.6;

contract SafeMathTester {
    // Max size of a uint8 is 255

    uint8 public bigNum = 255; // unchecked meaning that if you passed the upper

    // limit of a number, it would just wrap around and start back from the lowest number
    // it could be.

    // V8 and up  - checked to make sure if you're going to do what's called overflow
    // or underflow on a variable, we can actually revert back to the unchecked version
    // by using the unchecked keyword.

    function add() public {
        unchecked {
            bigNum += 5;
        }
    }
}
