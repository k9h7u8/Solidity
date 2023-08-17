// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract mappingIterator{
    mapping (address=>uint) public values;
    address[] public arr;

    function pay(uint _value) public{
        values[msg.sender] = _value;
        arr.push(msg.sender);
    }
    function returnArray()public view returns(address[] memory){
        return arr;
    }
}