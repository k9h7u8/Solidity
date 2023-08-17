// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract loops{

    function Loop()public pure returns(uint){
        uint sum;
        //While Loop
        // uint count;
        // while(count<5){
        //     sum = sum +count;
        //     count= count+1;
        // }
        //  return sum;


        //For Loop
        // for (uint count =0; count<5; count++) 
        // {
        //     sum = sum +count;
        // }
        // return sum;


        //Do While Loop
        uint count;
        do{
            sum = sum +count;
            count= count+1;
        }while(count<5);
        return sum;

    }

}