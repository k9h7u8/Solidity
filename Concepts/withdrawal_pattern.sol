// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract withDrawal{
    address payable richest;
    mapping (address=> uint) investor;
    uint max;

    constructor() payable{
        richest = payable  (msg.sender);
        max= msg.value;
        richest.transfer(msg.value);
    }

    function sendEther() payable  public{
        require(msg.value> max, "You are not the richest");
        richest = payable (msg.sender);
        max = msg.value;
        // richest.transfer(msg.value);
        investor[msg.sender] =msg.value;
    }

    function withDraw() public{
        uint amount = investor[msg.sender];
        investor[msg.sender] = 0;
        msg.sender.transfer(amount);
    }
}

contract demo{
    function A() public  pure{
        uint a=5;
    }
    fallback() payable external {
        revert();
    }
}
