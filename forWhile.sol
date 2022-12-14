//Solidity supports for, while and do while loops
//Loops can cause transaction to fail as unbounded loops can use all gas hence loops are rarely used

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Loop {
    function loop() public {
        //for loop
        for(uint i = 0; i < 10; i++) {
            if(i == 3) {
                //Skip next iteration
                continue;
            }
            if(i == 5) {
                //Exit loop with break
                break;
            }
        }

        //while loop
        uint j;
        while(j < 10) {
            j++;
        }
    }
}