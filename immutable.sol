//Immutable variables are like constants, values of immutable variables can be set inside the constructor but cannot be modified afterwards

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Immutable {
    //Uppercase coding convention for immutable variables
    address public immutable MY_ADDRESS;
    uint public immutable MY_UINT;

    constructor(uint _myUint) {
        MY_ADDRESS = msg.sender; //Global Variable
        MY_UINT = _myUint;
    }
}