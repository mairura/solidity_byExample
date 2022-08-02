// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

//Import Foo.sol
import "./Foo.sol";

//Import { symbol1 as alias, symbol2} from "filename"
import { Unauthorized, add as func, Point } from "./Foo.sol"; //TODO: why again import this?

contract Import {
    //Initialize Foo.sol
    Foo public foo = new Foo();

    //Test Foo.sol by getting it's name
    function getFooName() public view returns (string memory) {
        return foo.name(); //returns Foo
    }
}

//External Imports

//You can also import from Github by copying the url
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v4.5/contracts/utils/cryptography/ECDSA.sol";