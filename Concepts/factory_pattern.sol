// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract computerCompany{
    Desktop[] public desktop;
    function  create() public{
        desktop.push(new Desktop());
    }

}

contract Desktop{

}