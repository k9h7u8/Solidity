// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract demo{
    //state variable
    uint public num;

    // constructor(){
    //     num = 10;
    // }

    function setter()public{
        num = 100;
    }

    function local () public pure returns(uint){
    //local variable
        uint a;
        uint b;
        return a+ b;
    }
}