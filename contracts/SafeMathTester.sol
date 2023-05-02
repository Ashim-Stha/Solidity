//SPDX-License-Identifier: MIT


pragma solidity ^0.8.0;

contract SafeMathTester{

    uint8 public bignumber =255;

    function add() public {
        //bignumber = bignumber + 1;
        unchecked{bignumber = bignumber + 1;}
    }

}

//uint8 can take max num upto 255 before 0.6 solidity after we add 1 to 255 th value resets to zero
//but in newly version it reports erro if we want to make it reset to zero we use unchecked
//say our math wont exceed the limit then using unchecked is gas efficient