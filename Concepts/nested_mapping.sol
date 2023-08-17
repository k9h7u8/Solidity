// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract maapping{
    mapping (uint=>mapping (uint=>bool)) public data;

    function insert(uint row, uint col, bool val) public{
        data[row][col] = val;
    }
    
    function getData(uint row, uint col) public view returns(bool){
        return data[row][col];
    }
}