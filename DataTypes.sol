//Primitive Data Types
//-bool, -uint, -int, -address
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Primitives {
    bool public boo = true;

    uint8 public u8 = 1; //It would never be a negative number
    uint public u256 = 456;
    uint public u = 123; //uint is an alias for uint256

    //Negative numbers are allowed for int numbers
    int8 public i8 = -1;
    int public i256 = 456;
    int public i = -123; //int is same as int256

    

}