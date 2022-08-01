//Gas - is a unit of computation
//Gas Spent - total amount of gas used in a transaction
//Gas Price - amount of ether you willing to pay for your transaction

//GAS LIMIT
//Gas Limit - max amount of gas you willing to use for your transaction- set by you
//Block gas Limit - max amount of gs allowed in a block - set by network

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract gas {
    uint public i = 0;

    function forever() public {
        //Loop runs until all gas is used up
        while (true) {
            i += 1;
        }
    }
}