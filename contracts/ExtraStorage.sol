// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./SimpleStorage.sol";

//Inheritance

contract ExtraStorage is SimpleStorage{

/*IN order to override function of parent we should make that function virtual using virtual keyword
and use override keyword in new function */

function store(uint256 favnum) public override {
      favoriteNumber = favnum + 5;
}

}
