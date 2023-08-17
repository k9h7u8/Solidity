// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract structure{
 struct student{
    string name ;
    uint id;
    bool pass;
 }

 student public s1;

    function insert(string memory _name, uint _id, bool _pass) public {
        s1  = student(_name, _id, _pass);
        // s1.name= _name;
        // s1.id = _id;
        // s1.pass = _pass;
    }

    function get() public view returns(student memory){
        return s1;
    }

    function getName() public view returns(string memory){
        return s1.name;

    }

    //Array of structure
    student[4] public std;
}