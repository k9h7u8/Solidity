// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract Book{
   uint length;
   uint breadth;
   uint height;

   function setDimensions(uint _length, uint _breadth, uint _height)public {
       length = _length;
       breadth =_breadth;
       height = _height;
   }

   function getDimensions() public view returns(uint, uint, uint){
       return (length, breadth, height );
   }
}