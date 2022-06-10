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

// Both wallets and contracts can hold native blockchain token like Ethereum.

pragma solidity ^0.8.7;

contract FundMe {
    uint256 public minValue = 50;

    function fund() public payable {
        // Smart contracts can hold funds just like how wallets can
        // Want to be able to set a minium fund amount in USD
        // 1. How do we send ETH to this contract?

        // Using msg.value to get how much value somebody is sending
        require(msg.value > 1e18, "Didn't send enough"); // 1e18 is equal to 1 * 10 ** 18
    }

    // function withdraw() {}
}
