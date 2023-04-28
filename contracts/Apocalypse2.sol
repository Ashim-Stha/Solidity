//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./Apocalypse.sol";

contract Apocalypse2 is Apocalypse{

 function add(uint256 _first,uint256 _second)public override {
        sum = _first + _second + 5;
 }
}