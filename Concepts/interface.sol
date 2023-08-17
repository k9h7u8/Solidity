// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

interface car{
    function gear() external returns(uint);
}

contract SuperCar is car{
    function gear() external pure returns(uint){
        return 4;
    }
}