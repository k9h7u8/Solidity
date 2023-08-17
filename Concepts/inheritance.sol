// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Model{ //Parent
 string public name="NYC"; 
 uint public length;
  uint public height;
   uint public breadth;

    function welcomMessage() public pure returns(string memory){
        return "Hello to NYC";
    }
}

contract NewModal is Model{ //Child

    bool public heatResitant= true; 
    function greetings() public pure returns(string memory){ 
        return "Good Morning"; 
    }

}