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

    //minimum and maximum of int
    int public minINt = type(int).min;
    int public maxInt = type(int).max;

    //address
    address public addr =  0xCA35b7d915458EF540aDe6068dFe2F44E8fa733c;

    //Data Types represent a dynamic array of bytes
    //Solidity represents two types of bytes types
    // -fixed-sized byte arrays
    // -dynamically-sized byte arrays
    
    bytes1 a = 0xb5;
    bytes1 b = ox56;

    //Default values
    bool public defaultBoo; //false
    uint public defaultUint; //0
    int public defaultInt; //0
    address public defaultAddr; //0x0000000000000000000000000000000
}