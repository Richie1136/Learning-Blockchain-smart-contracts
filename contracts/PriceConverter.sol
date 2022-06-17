// SPDX-License-Identifier: MIT

// Libraries can't have any state variables and they also can't send ether

// All the functions in a library are going to be internal

pragma solidity ^0.8.7;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

library PriceConverter {
    function getPrice() internal view returns (uint256) {
        // Getting the price of ethereum in terms of USD, so we can convert our message.value
        // to USD
        // ABI
        // Address //0x8A753747A1Fa494EC906cE90E9f37563A8AF630e
        // Price feed object
        AggregatorV3Interface priceFeed = AggregatorV3Interface(
            0x8A753747A1Fa494EC906cE90E9f37563A8AF630e
        );
        // price is an int because a price could be positive or negative
        (, int256 answer, , , ) = priceFeed.latestRoundData();
        // ETH in terms of USD
        return uint256(answer * 1e10); // 1**10
        // converting the price value from a int256 to a uint256
    }

    function getVersion() internal view returns (uint256) {
        AggregatorV3Interface priceFeed = AggregatorV3Interface(
            0x8A753747A1Fa494EC906cE90E9f37563A8AF630e
        );

        return priceFeed.version();
    }

    function getConversion(uint256 ethAmount) internal view returns (uint256) {
        // Converting the msg.value from ethereum to terms of USD
        uint256 ethPrice = getPrice();
        // 3000_000000000000000000 3 thousand dollars ETH / USD Price
        // We send 1_000000000000000000 ETH
        // Multiple the 2 numbers above and then divide 1_000000000000000000
        uint256 ethAmountInUSD = (ethPrice * ethAmount) / 1e18;
        return ethAmountInUSD;
    }
}
