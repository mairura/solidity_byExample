//Data Locations - Variables are declared as either storage,memory or calldata...
//Storage - variable is a state variable(dtored on the blockchain) - State Variables
//Memory - variables is in memory and it exists while a function is being called - Local Variable
//Calldata - special data location that contains function arguments

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract DataLocations {
    uint[] public arr;
    mapping(uint => address) map;
    struct MyStruct {
        uint foo;
    }
    mapping(uint => MyStruct) myStructs;

    function f() public {
        //call _f with state variables
        _f(arr, map, myStructs[1]);

        //get a struct from a mapping
        MyStruct storage myStruct = myStructs[1];
        //Creat a struct in memory
        MyStruct memory myMemStruct = MyStruct(0);
    }

    function _f(uint[] storage _arr, mapping(uint => address) storage _map, MyStruct storage _myStruct) internal {
        //do someting with this variables
    }

    //You can return memory variables
    function g(uint[] memory _arr) public returns (uint[] memory) {
        //do something with this
    }

    function h(uint[] calldata _arr) external {
        //do something with this 
    }
}