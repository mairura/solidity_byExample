//A contratc is an optional function that is executed upon contract creation

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

//Base contract x
contract X {
    string public name;

    constructor(string memory _name) {
        name = _name;
    }
}

contract Y {
    string public text;

    constructor(string memory _text) {
        text = _text;
    }
}

//Ways to initialize parent contract with parameters

//Pass the parameters here in the inheritance list
contract B is X("Input to X"), Y("Input to Y") {}

contract C is X,Y {
    constructor(string memory _name, string memory _text) X(_name) Y(_text) {}
}

//Parent constructors are always called in the order of inheritance regardless of the order of parent contracts listed in the contructor of the child contract

//Order of contructors called:
//1. X
//2. Y
//3. D

contract D is X, Y {
    constructor() X("X was called") Y("Y was called");
}

//Order of contructors caled:
//1. X
//2. Y
//3. E
contract E is X, Y {
    constructor() Y("Y was called") X("X was called";)
}