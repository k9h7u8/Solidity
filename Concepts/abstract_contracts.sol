// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

abstract contract Model{

    function sub(uint a,uint b) public pure returns(uint){
        return a-b; 
    } 

    function add(uint a,uint b) public pure virtual returns(uint); 
}

contract developer is Model{
    function add(uint a,uint b) public pure override returns(uint){
        return a+b; 
    } 
}