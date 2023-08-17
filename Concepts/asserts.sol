// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract Assert{
    uint  public balance;

    function deposit(uint _amount) public{
        balance+= _amount;
        assert(balance <= 100);
    }

}