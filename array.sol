//Array have a compile-time fixed size or a dynamic size

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Array{
    //Ways to initialize an array
    uint[] public arr;
    uint[] public arr2 = [1, 2, 3];

    //Fixed-size array all elements initialize to 0
    uint[10] public myFixedSizeArr;

    function get(uint i) public view returns (uint) {
        return arr[i];
    }

    //This function should be avoided since arrays can grow indefinitely in length
    function getArr() public view returns (uint[] memory) {
        return arr;
    }

    function push(uint i) public {
        //Append an array
        arr.push(i);
    }

    function pop() public {
        //Remove last element from an array
        arr.pop();
    }
    
    //Get the length of an array
    function getLength() public view returns (uint) {
        return arr.length;
    }

    function remove(uint index) public {
        //Delete does not change the array length rather it resets to default value that is 0
        delete arr[index];
    }

    function examples() external {
        //Create an array in memory, only fixed size can be created
        uint[] memory a = new uint[](5);
    }
}

//Examples of removing array elements
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract ArrayRemoveByShifting {
    //Examples
    //[1, 2, 3] --remove(1) -->[1, 3, 3] --> [1, 3]\
    //[1, 2, 3, 4, 5, 6] --remove(2) --> [1, 2, 4, 5, 6, 6] --> [1, 2, 4, 5, 6]
    //[1, 2, 3, 4, 5, 6] --remove(0) --> [2, 3, 4, 5, 6, 6] --> [2, 3, 4, 5, 6]
    //[1] -- remove(0) --> [1] --> []

    uint[] public arr;

    function remove(uint _index) public {
        require(_index < arr.length, "index out of bound");

        for(uint i = _index; i < arr.length - 1; i++) {
            arr[i] = arr[i + 1];
        }
        arr.pop();
    } 

    function test() external {
        arr = [1, 2, 3, 4, 5];
        remove(2); //[1, 2, 4, 5]

        assert(arr[0] == 1);
        assert(arr[1] == 2);
        assert(arr[2] == 4);
        assert(arr[3] == 5);
        assert(arr.length == 4);

        arr = [1];
        remove(0);
        //[]
        assert(arr.length == 0);
    }
}

//Remove array elements by copying last element into to the place to remove

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract ArrayReplaceFromEnd {
    uint[] public arr;

    //Deleting an element in an array creates a gap sp one trick is to keep the array compact is to move the last element into the place to delete
    function remove(uint index) public {
        //Move the last element into the place to delete
        arr[index] = arr[arr.length - 1];
        //Remove the last element
        arr.pop();
    }

    function test() public {
        arr = [1, 2, 3, 4];

        remove(1);
        //[1, 4, 3]
        assert(arr.length == 3);
        assert(arr[0] == 1);
        assert(arr[1] == 4);
        assert(arr[2] == 3);

        remove(2);
        //[1, 4]
        assert(arr[0] == 1);
        assert(arr[1] == 4);
    }
}