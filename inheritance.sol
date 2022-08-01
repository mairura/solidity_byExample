//Solidity supports multiple inheritance. Contract scan inherit other contracts by using is keyword
//Function that is going to be overridden b a child contract must be declared as virtual
//Function that is going to override a parent function must use the keyword override
//Order of inheritance is important
//YOu must list the parent contracts inthe order from most base-like to most derived

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

//copied

/* Graph of inheritance
    A
   / \
  B   C
 / \ /
F  D,E

*/

contract A {
    function foo() public pure virtual returns (string memory) {
        return "A";
    }
}

//Contracts inherit from other contracts using is keword
contract B is A {
    //Override A.foo()
    function foo() public pure virtual override returns (string memory) {
        return "B";
    }
}

contract C is A {
    //Override A.foo()
    function foo() public pure virtual override returns (string memory) {
        return "C";
    }
}

//Contracts can inherit from multiple parent contracts
//When a function is called that is defined multiple times in different contracts, parent contracts are searched from right to left, in deoth-first manner

contract D is B, C {
    //D.foo() returns "C" since C is the parent contract with function foo()
    function foo() public pure override(B, C) returns (string memory) {
        return super.foo();
    }
}

contract E is C, B {
    //E.foo() returns "B" since B is the most parent contract
    function foo() public pure override(C, B) returns (string memory) {
        return super.foo();
    }
}