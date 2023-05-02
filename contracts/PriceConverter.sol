//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";


//library cant have any state variables and cant send ether

library PriceConverter{

      function getPrice() internal view returns (uint256) {
        //we require ABI And address
      //  0x694AA1769357215DE4FAC081bf1f309aDC325306

      AggregatorV3Interface pricefeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
    // (uint80 roundID,int price,uint startedAt,uint timeStamp,uint80 answeredInRound) = pricefeed.latestRoundData();
     (,int price,,,) = pricefeed.latestRoundData();

       //Eth in terms of USD
       //3000.00000000
       return uint256(price * 1e10);//typecating to uint256 because price is in int
    }

   function getVersion() internal view returns (uint256){
       AggregatorV3Interface pricefeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
       return pricefeed.version();
   }

   function conversionRate(uint256 ethamt) internal view returns (uint256){
       uint256 ethPrice = getPrice();
       uint256 ethInUsd = (ethamt * ethPrice)/1e18;
       return ethInUsd;

   }
}