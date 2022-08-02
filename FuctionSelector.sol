//When a function is called, the first 4 bytes of calldata specifies which function to call

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

//TODO: Get to learn more on this
contract FunctionSelector {
    function getSelector(string calldata _func) external pure returns (bytes4) {
        return bytes4(keccak256(bytes(_func)));
    }
}