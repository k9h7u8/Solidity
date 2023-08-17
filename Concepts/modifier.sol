//SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 <0.9.0;

contract Modifier {
    address owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "You are not owner");
        _;
    }
    modifier onlyEven(uint256 _val) {
        require(_val % 2 == 0, "Value is odd");
        _;
    }

    function check(uint256 _val)
        public
        view
        onlyOwner
        onlyEven(_val)
        returns (uint256)
    {
        return _val;
    }
}