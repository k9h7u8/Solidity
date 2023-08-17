// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;
contract Company{
    mapping (string=> address) public register;

    function comapanyCall() public{
        register["CEO"] = address(new CEO());
        register["HR"] = address(new HR());
        register["Manager"] = address(new Manager());
    }
}
contract HR{

}
contract CEO{

}
contract Manager{

}

