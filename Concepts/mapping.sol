// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract maapping{
    // mapping (uint=>string) data;

    // function insert(uint _roll, string memory _name) public{
    //     data[_roll] = _name;
    // }
    
    // function getData(uint _roll) public view returns(string memory){
    //     return data[_roll];
    // }
    

    //Mapping with Array

    // mapping(address=>uint[]) public marks;
    // function insertMarks(address _address,uint _marks) public {
    //     marks[_address].push(_marks);
    //     } 

    // function returnMarks(address _address) public view returns(uint[] memory){
    //     return marks[_address]; 
    //     }


    //Mapping with struct

    struct student{
    string name ;
    uint id;
    bool pass;
 }
    mapping(uint => student) public details;

    function insertDetails(uint _index,string memory _name, uint _id, bool _pass) public {
        details[_index]= student(_name,_id,_pass);
        } 

    function returnDetails(uint _index) public view returns(student memory){
        return details[_index]; 
        }
}