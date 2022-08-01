//Functions and state variables have to declare whether they are accessible by other contracts
//Functions can be declared as:
// - public - any function can access it; any contract and account can call
// - private - can be accessed only from this contract itself; only inside the contract that defines the function
// - internal - can be acccessed only by this contract or contracts deriving from it:
// - external - can be accessedonly by external callers not internal functions

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Base {
    //Private function can only be called inside this contract
    //COntracts that inherit this contract cannot call this contract
    function privateFunc() private pure returns (string memory) {
        return "private function called";
    }

    function testPrivateFunc() public pure returns (string memory) {
        return privateFunc();
    }

    //Internal functions can be called inside this contract or inside contracts that inherit this contract
    function internalFunc() internal pure returns (string memory) {
        return "internal function called";
    }

    function testInternalFunc() public pure virtual returns (string memory) {
        return internalFunc();
    }

    //Public functions can be called inside the contract, inside contracts that inherit this contract or by other contracts and accounts
    function publicFunc() public pure returns (string memory) {
        return "public function called";
    }

    //External functions can be called by other contracts and accounts
    function externalFunc() external pure returns (string memory) {
        return "external function called";
    }

    //This function will not compile since we are trying to cal an external function here
    //function testExternalFunc() public pure returns (string memory) {
     //   return externalFunc();
    //}

    //State Variables
    string private privateVar = "my private variables";
    string internal internalVar = "my internal variable";
    string public publicVar = "my public variable";

    //State variables cannot be external so this code wont compile
    //string external externalVar = "my external variable";
}
