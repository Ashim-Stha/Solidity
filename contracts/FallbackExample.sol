//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

//if anyone send eth without using fund function we keep track of it 
//There are special functions that dont require function keyword
//receive
//fallback

contract FallbackExample{
   uint256 public result;

   receive() external payable {
      result=1;
      //if anyone even send 0 eth in calldata result is set to 1
      //if some data is send with it in calldata result isnot set
   }
   
   fallback() external payable {
       result=2;
       //this function gets called when random data is send on calldata
   }

}