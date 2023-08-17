// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract enumType{
   enum Button {ON , OFF}
   Button public x;

   function checkStatus() public view returns(Button){
       return x;
   }

   function returnButton() public view returns(string memory){
      if (x==Button.ON){
          return "Button is ON";
      }else{
          return "Button is OFF";
      }
   }

   function changeStatus(Button _x) public{
       x=_x;

   }
}