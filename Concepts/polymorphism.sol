// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract demo{
    function sum(uint a,uint b) public pure returns(uint){
        return a+b; 
    } 

    function sum(uint a,uint b, uint c) public pure returns(uint){
        return a+b+c; 
    } 
}