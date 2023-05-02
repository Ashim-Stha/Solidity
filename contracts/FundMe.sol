//Get funds from users
//withdraw funds
//Set a minimum funding value in USD

//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract FundMe{
    //uint256 public num;

    uint256 public minusd=50;
    address[] public funders;

    mapping(address => uint256) public addresstoamt;


        function fund() public payable{
        //num=5;

        //msg.value = amt of ether or wei 
        //18 decimels
        require(conversionRate(msg.value) >= minusd,"Insufficient"); //1e18 = 1*10 to the power 18 wei = 1 ether
        //if condition is not met the after comma part is executed
        //if any computation is before require then it reverts meaning undo the action before it and send remaining gas back
       
       funders.push(msg.sender);
       addresstoamt[msg.sender]=msg.value;
    }

    function getPrice() public view returns (uint256) {
        //we require ABI And address
      //  0x694AA1769357215DE4FAC081bf1f309aDC325306

      AggregatorV3Interface pricefeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
    // (uint80 roundID,int price,uint startedAt,uint timeStamp,uint80 answeredInRound) = pricefeed.latestRoundData();
     (,int price,,,) = pricefeed.latestRoundData();

       //Eth in terms of USD
       //3000.00000000
       return uint256(price * 1e10);//typecating to uint256 because price is in int
    }

   function getVersion() public view returns (uint256){
       AggregatorV3Interface pricefeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
       return pricefeed.version();
   }

   function conversionRate(uint256 ethamt) public view returns (uint256){
       uint256 ethPrice = getPrice();
       uint256 ethInUsd = (ethamt * ethPrice)/1e18;
       return ethInUsd;

   }
}