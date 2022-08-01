//Enumarables are useful to model choice and keep track of state
//Enums can be declared outside of a contract

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Enum {
    //Enum representing shipping status
    enum Status { Pending, Shipped, Accepted, Rejected, Canceled }

    //Default value is pending
    Status public status;
    
    //Returns uint
    //Pending - 0
    //Shipped - 1
    //Accepted - 2
    //Rejected - 3
    //Canceled - 4

    function get() public view returns (Status) {
        return status;
    }

    //Update status by passing uint into input
    function set(Status _status) public {
        status = _status;
    }

    //You can update to a specific enum like this
    function cancel() public {
        status = Status.Canceled;
    }

    //Delete resets the enum to its first value
    function reset() public {
        delete status;
    }
}

//Declaring and importing Enum

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;
// This is saved 'EnumDeclaration.sol'

enum Status {
    Pending,
    Shipped,
    Accepted,
    Rejected,
    Canceled
}

//File that imports enum above
pragma solidity ^0.8.13;

import "./EnumDeclaration.sol";

contract Enum {
    Status public status;
}