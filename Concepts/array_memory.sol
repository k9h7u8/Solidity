// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract demo{
    //Fixed size array

    uint[5] public arr;
    
    function insertArr(uint[5] memory _arr) public {
        arr= _arr;
    }


}