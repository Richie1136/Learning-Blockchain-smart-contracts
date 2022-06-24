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

// When working with a contraxt, you always need the ABI and the address when compiled an
// interface gives us that minimalistic ABI to interact with contracts outside of your project.

// When you combine these compiled interfaces with an address, we can call the functions
// on that interface on that contract. Chain link data feeds are a decentralized way to
// get information about the real world. In this case, we're getting the price of ethereum
// in terms of USD from a decentralized collective of chain link nodes. When working with math
// and solidity. Decimals don't work. So we need to keep that in mind when doing any type
// of math in solidity. And we need to make sure we always have the correct units, so that
// our math makes sense.

// msg.value and msg.sender are globally available variables were msg.sender represents
// the sender of the message or transaction and msg.value represents the number of WEI sent
// with the message.

// = is a set parameter
// == how you check to see if two variables are equivalent

// constructor, receive and fallback don't need the function keyword because they
// are special functions

// Constant and Immutable are keywords that could be used to save gas in the long run.

// Constant and immutable are for variables that can only be declared and updated once.

pragma solidity ^0.8.7;

import "./PriceConverter.sol";

error NotOwner();

// Constant, Immutable

// When you add the constant keyword the minUSD no longer takes up a storage spot,
// and is much easier to read too.

// Immutable variables can be assigned an arbitary value in the constructor of a
// contract or at the point of their declaration

// They cannot be read during construction time and can only be assigned once.

// Contract cost 773,928 of gas
// Contract cost after adding constant keyword to minUSD 754,398
contract FundMe {
    using PriceConverter for uint256;
    uint256 public constant minUSD = 50 * 1e18;
    // Cost with constant 21,481
    // Cost without constant 23,581

    // 21,481 * 22000000000 = 472,582,000,000,000 = $0.52976914782
    // 23,581 * 22000000000 = 518,782,000,000,000 = $0.58167394186

    address[] public funders;
    mapping(address => uint256) public addressToAmountFunded;

    address public immutable i_owner;

    constructor() {
        // constructor is a function that gets immediately called in the same
        // transaction, that we create the contract, this constructor function is
        // going to be incredibly helpful for us, because it allows us to set up the
        // contract the way we want it to be

        i_owner = msg.sender;
    }

    function fund() public payable {
        // Smart contracts can hold funds just like how wallets can
        // Want to be able to set a minium fund amount in USD
        // 1. How do we send ETH to this contract?

        msg.value.getConversion();

        // Using msg.value to get how much value somebody is sending
        // Dont need to pass anything to the getConversion because msg.value is
        // considered the first parameter for any of these library functions
        require(msg.value.getConversion() >= minUSD, "Didn't send enough"); // 1e18 is equal to 1 * 10 ** 18
        // 18 Decimal places becuase 1 ether === 1000000000000000000(18 0s)
        funders.push(msg.sender); // The address of the sender
        addressToAmountFunded[msg.sender] = msg.value;
    }

    function withdraw() public onlyOwner {
        // We are saying before you read all of this code inside of it, look down at the
        // only owner modifier and do whatever is in there first, and then do whatever is
        // in the underscore.

        // ONE WAY OF MAKING SURE THE OWNER IS THE SENDER
        // require(msg.sender == owner, "Sender is not the Owner");

        // looping over the funders array in solidity
        for (
            uint256 funderIndex = 0;
            funderIndex < funders.length;
            funderIndex++
        ) {
            address funder = funders[funderIndex];
            // Grabbing the indexes of the funders object and it returns a funders
            // address
            addressToAmountFunded[funder] = 0;
            // resetting the addressToAmountFunded at the funder key back to zero
        }
        // reset array to make the funders a blank array
        funders = new address[](0);
        // actually withdraw the funds

        // Three different ways to send ether or native blockchain currency to
        // other contracts

        // transfer max 2300 gas, throws error
        // send max 2300 gas, returns bool
        // call forward all gas or set gas, returns bool

        // Call is the recommended way to send and receive ethereum or your blockchain
        // native token.

        // msg.sender = address
        // payable(msg.sender) = payable address

        // First way to send ethereum or send tokens from different contracts to each other,
        // we wrap the address that we want to send it in, in the payable keyword, we do
        // .transfer, and then we say exactly how much we want to transfer

        // Issue with transfer is that it is capped at 2300 gas and if more gas is used, it
        // throws an error

        // TRANSFER

        payable(msg.sender).transfer(address(this).balance);
        // The this keyword refers to the whole contract.balance, and can get the
        // native blockchain currency or the ethereum currency balance of the address like this.

        // Transfer automatically reverts if the transfer fails

        // SEND

        bool sendSuccess = payable(msg.sender).send(address(this).balance);
        // if this fails, we will still revert by adding our require statement here.

        // Send will only revert the transaction if we add this require statement here.
        require(sendSuccess, "Send failed");

        // CALL

        // Call function is incredibly powerful, we can use it to call virtually any function
        // in all of ethereum without even having to have the ABI.

        (bool Success, bytes memory dataReturned) = payable(msg.sender).call{
            value: address(this).balance
        }("");
        require(Success, "Call failed");
        // function returns two variables.

        // Since call allows us to call different functions, if that function returns
        // some data or returns value, we're going to save that in the data returned variable.

        // It also returns Success, where if the function was successfully called this will be
        // true. If not, this will be false. And since bytes objects are arrays, data returns
        // needs to be in memory
    }

    modifier onlyOwner() {
        // A modifier is used to modify the behavior of a function.
        if (msg.sender != i_owner) revert NotOwner();
        // The underscore represents doing the rest of the code
        _;
    }

    // What happens if someone sends this contract ETH without calling the fund function
    receive() external payable {
        fund();
    }

    fallback() external payable {
        fund();
    }
}

// 1. Enums
// 2. Events
// 3. Try / Catch
// 4. Function Selectors
// 5. abi.encode / decode
// 6. Hashing
// 7. Yul / Assumbly
