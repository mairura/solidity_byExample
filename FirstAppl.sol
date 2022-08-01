// SPDX-License-Identifier: MIT
//A simple contract to get, increament, decrement the count in a store
pragma solidity ^0.8.13;

contract Counter {
    uint public count;

    //Function will get the current count
    function get() public view returns (uint) {
        return count;
    }

    //Function to increment count by 1
    function inc() public {
        count += 1;
    }

    //Function to decrement count by 1
    function dec() public {
        //Will fail if count = 0
        count -= 1;
    }
}