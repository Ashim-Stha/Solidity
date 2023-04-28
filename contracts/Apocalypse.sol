// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Apocalypse{
   uint256 public first;
   uint256 public second;
   uint256 public sum;

   struct Student {
        string name;
        uint256 roll;
   }

   Student[] public st;

    mapping(string => uint256) public nametoroll;

   function add(uint256 _first,uint256 _second) public virtual{
       first=_first;
       second=_second;
       sum = _first + _second;
   }

   function details(string memory _name,uint256 _roll) public {
      st.push(Student(_name,_roll));

      nametoroll[_name]=_roll;
   }

//      mapping(uint256 => Student) public sts;

//   function getPerson() public view returns (Student memory) {
//     Student memory person = Student("Alice", 30);
//     return person;
// }

// function Ddetails(string memory _name, uint256 _roll) public returns (Student memory) {
//     Student memory newStudent = Student(_name, _roll);
//     st.push(newStudent);
//     nametoroll[_name] = _roll;
//     return newStudent;
// }

   




}