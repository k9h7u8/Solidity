// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract structure{
 struct student{
    string name ;
    uint roll;
    bool pass;
 }

    //Array of structure
    student[] public std;

    function insertStudent(uint index, string memory _name, uint _roll, bool _pass) public{
        // std[index] = student(_name, _roll ,_pass);
         std.push(student(_name, _roll ,_pass));
    }

    function returnStudent(uint index) public view returns(student memory){
        return std[index];

    }
}