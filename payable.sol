//Functions and addresses declared payable can receive ether into the contract

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Payable {
    //Payable address can receive ether
    address payable public owner;

    //Pyable constructor can receive ether
    constructor() payable {
        owner = payable(msg.sender);
    }

    //Functions to deposit ether into tis contract. Call this function along with Ether, the balance will be automatically be updated
    function deposit() public payable {}

    //Call this function along with Ether. It would not throw an error since this function is not payable
    function notPayable() public {}

    //Function to withdraw all ether from a contract
    function withdraw() public {
        //Get amount of ether stored in a contract
        uint amount = address(this).balance;

        //send all ether to owner
        //Owner can receive ether since the address is payable
        (bool success) = owner.call{value: amount}("");
        require(success, "Failed to send ether");
    }

    //Function to transfer ether from this contract to address from input
    function transfer(address payable _to, uint _amount) public {
        //Note that to is declared as payable
        (bool success) = _to.call{value: _amount}("");
        require(success, "Failed to send Ether");
    }
}