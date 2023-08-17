// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract Revert{
    uint balance = 10;
    uint a = 0;
    function callMe(uint _amount) public returns(uint){
        a= 5;
        // require(balance>_amount,  "Balance is less than the amount");
        // return balance;

        if(balance>_amount){
            return balance;
        }else{
           revert( "Balance is less than the amount"); 
        }
    }

    function call() public view returns(uint){
        return a;
    }
}