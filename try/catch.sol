//Try/Catch can only catch errors from external function calls and contract creation

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

//External contract used for try / catch example
contract Foo {
    address public owner;

    constructor(address _owner) {
        require(_owner != address(0), "Invalid address");
        assert(_owner != 0x3db7B2413ae63E7e2D1a462119787C3aa3c0459e);
        owner = _owner;
    }

    function myFunc(uint x) public pure returns (string memory) {
        require(x != 0, "require failed");
        return "my func was called";

    }
}

contract Bar {
    event Log(string message);
    event LogBytes(bytes data);

    Foo public foo;

    constructor() {
        //This Foo contract is used as an example of try catch with external calls
        foo = new Foo(msg.sender);
    }

    // Example of try / catch with external call
    
    // tryCatchExternalCall(0) => Log("external call failed")
    // tryCatchExternalCall(1) => Log("my func was called")
    function tryCatchExternalCall(uint _i) public {
        try foo.myFunc(_i) returns (string memory result) {
            emit Log(result);
        }catch {
            emit Log("External call failed");
        }
    }

    // Example of try / catch with contract creation

    // tryCatchNewContract(0x3db7B2413ae63E7e2D1a462119787C3aa3c0459z) => Log("invalid address")
    // tryCatchNewContract(0x3db7B2413ae63E7e2D1a462119787C3aa3c0459e) => Log("Foo created")
    function tryCatchNewContract(address _owner) public {
        try new Foo(_owner) returns (Foo foo) {
            emit Log("Foo created");
        }catch Error(string memory reason) {
            //catch failing revert() and require()
            emit Log(reason);
        }catch(bytes memory reason) {
            //catch failing assert()
            emit LogBytes(reason);
        }
    }

}