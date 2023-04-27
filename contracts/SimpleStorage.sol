// SPDX-License-Identifier: MIT
pragma solidity 0.8.8;
//pragma solidity ^0.8.8 tells at least 0.8.8 and above

contract SimpleStorage{
    /*data types
    bool used to represent true or false

    uint is unsigned int represents only positive number
    we can allocate bits for uint variable 
    eg uint8 allocates 8 bit while default is uint256

    int can be positive or negative also int256

    string

    bytes32 represents string but we can allocate bytes and string is converted into hexa

    address represents address of account

*/
  
  uint256 public favnum; // using public initiates get like function that returns its value

  function store (uint256 _favnum) public  {
           favnum=_favnum;
  }

  struct Student {
      
      string name;
      uint256 roll;
  }

  //Student public st = Student({roll:3,name:'Ashim'});
  Student[] public st;

  mapping (string => uint256) public nametoroll;

  function addst(string memory nam,uint256 rol) public {
     st.push(Student(nam,rol));
     nametoroll[nam]=rol;
    //   Student memory newSt = Student({name:nam,roll:rol});
    //   st.push(newSt);
  }

//view ,pure function doesnot cost gas because we arenot updating any state on blockchain
//but if we call it inside other function it cost gas

//   function get() public view returns(uint256){
//       return favnum;
//   } //returns favnum


/*data location should be specified for array,struct 
 since string is also array of bytes we need to specify for it
 calldata,memory are variables stored temporarily
 calldata is used when we neednot modify the value otherwise memory
 once we neednot function they are removed
 storage is used to store permanently within code
 */
}