// SPDX-License-Identifier: MIT

// Transactions - Fields

// Nonce - transaction count for the account
// Gas Price - price per unit of gas (in wei)
// Gas Limit - max gas that this transaction can use
// To - address that the transaction is sent to
// Value - Amount of wei to send
// Data - What to send to the To address
// v,r,s - components of the transaction signature

// Transactions - Value Transfer

// Nonce - transaction count for the account
// Gas Price - price per unit of gas (in wei)
// Gas Limit - 21000
// To - address that the transaction is sent to
// Value - Amount of wei to send
// Data - empty
// v,r,s - components of the transaction signature

// Transactions - Function Call

// Nonce - transaction count for the account
// Gas Price - price per unit of gas (in wei)
// Gas Limit - max gas that this transaction can use
// To - address that the transaction is sent to
// Value - Amount of wei to send
// Data - What to send to the To address
// v,r,s - components of the transaction signature

// Get funds from users
// Withdraw funds
// Set a minimum funding value in USD

pragma solidity ^0.8.7;

contract FundMe {
    function fund() public {
        // Want to be able to set a minium fund amount in USD
        // 1. How do we send ETH to this contract?
    }

    // function withdraw() {}
}
