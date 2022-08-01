//An error will undo all changes made to the state during a transction
//You throw an error by calling require, revert or assert

//-require - used to validate inputs and conditions before execution
//-revert - similar to require
//-assert - used to check for code that shoul dnevrbe false. Failing assertion means that there is (bug)

//Use custom error to save gas

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Error {
    function testRequire(uint _i) public pure {
        //Require should be used to validate conditions such as:
        //-inputs
        //-conditions before execution
        //return values from calls to other functions
        require(_i > 10, "Input must be greater that 10");
    }

    function testRevert(uint _i) public pure {
        //Revert is useful when condition is complex
        if(_i <= 10) {
            revert("Input must be greater than 10");
        }
    }

    uint public num;

    function testAssert() public view {
        //assert should only be used when testing for internal errors and to check for invariants

        //Here we assert that num is always equal to 0 since it is impossible to update the value of num
        assert(num == 0);
    }

    //custom error
    error InsufficientBalance(uint balance, uint withdrawAmount);

    function testCustomError(uint _withdrawAmount) public view {
        uint bal = address(this).balance;
        if(bal < _withdrawAmount) {
            revert InsufficientBalance({balance: bal, withdrawAmount: _withdrawAmount});
        }
    }
}

//Another Example
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Account {
    uint public balance;
    uint public constant MAX_UINT = 2**256 - 1;

    function deposit(uint _amount) public {
        uint oldBalance = balance;
        uint newBalance = balance + _amount;

        //balance + _amount does not overflow if balance + _amount >= balance
        require(newBalance >= oldBalance, "Overflow");

        balance = newBalance;

        assert(balance >= oldBalance);
    }

    function withdraw(uint _amount) public {
        uint oldBalance = balance;

        //balance - _amount does not underflow if balance >= _amount
        require(balance >= _amount, "Underflow");

        if(balance < _amount) {
            revert("Underflow");
        }

        balance -= _amount;

        assert(balance <= oldBalance);
    }
}