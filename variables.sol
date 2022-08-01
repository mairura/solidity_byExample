//Variables
//3 types of Variables
//1. Local - declared inside a function but not stored on the blockchain
//2. State - declared outside a function but stored on the blockchain
//3. Global - provide info. about the blockchain

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Variables {
    //State Variables
    string public text = "Hello";
    uint public num = 123;

    function doSomething() public {
        //Local Variables
        uint i = 456;

        //Global Variables
        uint timestamp = block.timestamp; //Current block Timestamp
        address sender = msg.sender; //address of the caller
    }
}