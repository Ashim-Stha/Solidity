//Get funds from users
//withdraw funds
//Set a minimum funding value in USD

//SPDX-License-Identifier: MIT

pragma solidity ^0.8.8;

contract FundMe{
    uint256 public num;

    function fund() public payable{
        num=5;
        //msg.value = amt of ether or wei 
        require(msg.value > 1e18,"Insufficient"); //1e18 = 1*10 to the power 18 wei = 1 ether
        //if condition is not met the after comma part is executed
        //if any computation is before require then it reverts meaning undo the action before it and send remaining gas back

    }
}