// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Function {
    //Functions can return multiple values
    function returnMany() public pure returns (uint, bool, uint) {
        return (1, true, 2);
    }

    //Return values can be named
    function named() public pure returns (uint x, bool b, uint y) {
        return (1, tru, 2)
    }

    //Return values can be assigned to their named//In this case the return statement has been omitted
    function assigned() public pure returns (uint x, bool b, uint y) {
        x = 1;
        b = true;
        y = 2;
    }

    //Use destructuring assignment when calling another function that returns multiple values
    function destructringAssignment() public pure returns (uint, bool, uint, uint, uint) {
        (uint i, bool b, uint j) = returnMany();

        //Values can be left out
        (uint x, uint y) = (4, 5, 6);

        return (i, b, j, x, y);
    }

    //Function can not use map for either input or output

    //Can use array for input
    function arrayInput(uint[] memory _arr) public {}

    //can use array for output

    function arrayOutput() public view returns (uint[] memory) {
        return arr;
    }
}