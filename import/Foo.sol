// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

struct Point { //set of related data
    uint x;
    uint y;
}

error Unauthorized(address caller); //custom erro

function add(uint x, uint y) pure returns (uint) {
    return x + y;
}

contract Foo {
    string public name = "Foo";
}