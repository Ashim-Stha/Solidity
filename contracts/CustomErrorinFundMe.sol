
//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./PriceConverter.sol";

error notOwner();//using custom error for gas eff instead of require

contract FundMe{

    using PriceConverter for uint256;

    uint256 public constant minusd=50;//since this value not gonna change we make it const which takes less gas
    address[] public funders; //holds address

    mapping(address => uint256) public addresstoamt; //holds amount


        function fund() public payable{
       
        require(msg.value.conversionRate() >= minusd,"Insufficient"); //1e18 = 1*10 to the power 18 wei = 1 ether
     
       funders.push(msg.sender);
       addresstoamt[msg.sender]=msg.value;
    }
    
    address public immutable owner;//we use immutable whose value is set on constructor and is const so gas eff

    constructor(){
        owner = msg.sender;//whomever deploys the contract become owner
    }

    function withdraw() public onlyOwner {

      

        for(uint256 index=0;index<funders.length;index++){
            address funder = funders[index];
            addresstoamt[funder]=0;
        }
         //reseting the array
       funders = new address[] (0);


    (bool callSuccess,) = payable(msg.sender).call{value: address(this).balance}("");
      //require(callSuccess,"Call failed");
      if(!callSuccess){
     revert notOwner();
      }

        }

    modifier onlyOwner{
        //require(msg.sender == owner,"Sender is ot owner");
        if(msg.sender!=owner)
        {
            revert notOwner();
        }
        _; //tells to perform rest of the code of function
    }
   

   
}