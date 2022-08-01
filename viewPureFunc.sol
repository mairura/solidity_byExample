//Getter functions can be declared view or pure
//View - guarantess that no state of the smart contract will be altered 
//Pure - guarantees that the state of the contract willnot be altered or read in any way

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract ViewAndPure {
    uint public x = 1;

    //Promise not to modify the state of contract data
    function addToX(uint y) public view returns (uint) {
        return x + y;
    }

    //Promise not to modify or read from the state
    function add(uint i, uint j) public pure returns (uint) {
        return i + j;
    }
}