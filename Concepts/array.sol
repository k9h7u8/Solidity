// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract demo{
    //Fixed size array

    // uint[5] public arr = [10,20,30,40,50];
    // function insert(uint index,uint item) public{
    //     arr[index] = item;
    // }

    // function returnArrayElement(uint index) public view returns(uint){
    //     return arr[index];
    // }

    // function returnAllElement() public view returns(uint[5] memory){
    //     return arr;
    // }


    //Dynamic size array

    uint[] public array;

    function addElement(uint element) public{
        array.push(element);
    }

    function removeLastElement() public{
        array.pop();
    }

    function returnLength() public view returns(uint){
        return array.length;
    }

    function returnAllElements() public view returns(uint[] memory){
        return array;
    }


}