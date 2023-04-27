//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./SimpleStorage.sol";

contract StorageFactory{
   //SimpleStorage public simplestorage;

   //for array
   SimpleStorage[] public simpleStorageArray;

   function createNewContract() public {
     //  simplestorage = new SimpleStorage(); //creates new SimpleStorage contract,  contract deploying another contract

     SimpleStorage simpleStorage = new SimpleStorage();
     simpleStorageArray.push(simpleStorage);
   }

   //Interacting with contracts
   //we need address and ABI-Application Binary Interface

   function sfStore(uint256 simpleStorageindex,uint256 simpleStoragenum) public {
       
   }
}