// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract demo{
    //Fixed bytes size array
    // bytes1 public b1;
    // bytes2 public b2;
    // bytes3 public b3;

    // function setter () public{
    //     b1= "a";
    //     b2= "ab";
    //     b3 = "abc";
    // }


    //Dynamic bytes size array
    bytes public by= "abc";
    function pushElement() public{
        by.push('d');
    }

    function getElement(uint index) public view returns(bytes1){
        return by[index];
    }

    function getLength() public view returns(uint){
        return by.length;
    }

}