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

// Blockchain Oracle - Any device that interacts with the off-chain world to
// provide external data or computation to smart contracts

// Chainlink - is a modular, decentralized oracle network that can be customized to
// deliver any data or do any external computation that you like

// Both wallets and contracts can hold native blockchain token like Ethereum.

// Blockchain nodes can't make HTTPS calls, because they wouldn't be able to reach
// consensus. If they called the node at different times, or they did something
// else. All the consensus would be broken. So instead, we need a decentralized
// network of chain link oracle's to do this, and then in the transaction, this network
// of nodes will return the data to our smart contracts for us.

// In a single transaction, one node will deliver all the data with all the different
// signatures to a reference contract. If that node doesn't deliver the data, another
// node will send it instead.

// Reputation is incredibly important when your a chain link node operator if you
// miss data updates, if you forgdt to send transactions, you'll probably be quickly
// kicked off these networks and have no chance of making any more money in the future.

// In order to send ethereum or whatever native blockchain token with a function need
// to mark it as payable. If you need something in your contract to happen, and you
// want the whole transaction to fail. If that doesn't happen, you can use a require
// statement.To get the ethereum or native blockchain token value of a transaction, you
// can use the global keyword message.value. Chainlink is a technology for getting external
// data and doing external computation in a decentralized context for our smart contracts.

// Chainlink data feeds or price feeds are ways to read pricing information or other pieces
// of data from the real world that's already aggregated and decentralized for us, chainlink
// VRF is a way to get provably random numbers from the real into our smart contracts.

// Chainlink keepers are a way to do decentralized event driven computation. We can set some
// trigger say if this trigger hits do something and we get to define what the trigger is and
// what to do something is. Chainlink any API's is the ultimate customization of chainlink
// nodes and allows us to connect to anything on the planet. To make this production ready,
// we have to do the most work because it doesn't come already with a decentralized oracle
// network, like chaining the keepers and price feeds.

pragma solidity ^0.8.7;

contract FundMe {
    uint256 public minUSD = 50;

    function fund() public payable {
        // Smart contracts can hold funds just like how wallets can
        // Want to be able to set a minium fund amount in USD
        // 1. How do we send ETH to this contract?

        // Using msg.value to get how much value somebody is sending
        require(msg.value >= minUSD, "Didn't send enough"); // 1e18 is equal to 1 * 10 ** 18
    }

    // function withdraw() {}
}