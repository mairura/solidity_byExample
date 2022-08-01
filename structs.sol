//Structs are useful in grouping related data
//They can be declared outside of a contruct and imported in another contract

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Todos {
    struct Todo {
        string text;
        bool completed;
    }

    //An array of Todo structs
    Todo[] public todos;

    function create(string calldata _text) public {
        //Ways to initialize a struct
        // -calling it like a function
        todos.push(Todo(_text, false));

        //Key value mapping
        todos.push(Todo({text: _text, completed: false}))'

        //Initialize an empty struct then update it
        Todo memory todo;
        todo.text = _text;
        //todo.completed initializes to false

        todos.push(todo);

        
    }
}