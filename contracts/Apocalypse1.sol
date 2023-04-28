// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./Apocalypse.sol";

contract Apocalypse1{

Apocalypse[] public apo;

 function createNew() public{
     
     Apocalypse _apo = new Apocalypse();
     apo.push(_apo);
     
 }

 function store(uint256 index,string memory _name,uint256 value) public{
     apo[index].details(_name,value);
 }

 
}