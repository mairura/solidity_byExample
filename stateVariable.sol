//To write(update) or read to a state variable you will need to send a transaction: though you can read state variables without any transaction fee


// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract SimpleStorage {
    //State Variable to store a number
    uint public num;

    //You will need to send transaction to write to a state variables
    function set(uint _num) public {
        num = _num;
    }//You can read from a state variable without sending a transaction
    function get() public view returns (uint) {
        return num;
    }
}