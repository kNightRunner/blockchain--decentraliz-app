// SPDX-License-Identifier: MIT
pragma solidity ^0.8.6;

contract TaskContract{

    uint public taskCounter = 0;

    constructor ()  {
        createTask("First Contract", "Do something");
    }

    event TaskCreated(
        uint id,
        string title, 
        string description,
        bool done,
        uint createdAt
    );

event TaskToggleDone(uint id, bool done);

    struct Task {
        uint256 id;
        string title;
        string description;
        bool done;
        uint256 createdAt;
    }
//Mapping es un objeto que lleva el par clave valor
    mapping (uint256 => Task) public tasks;

//_ para los parametros
//Como es un lenguaje tipado hay que declarar los parametros
    function createTask(string memory _title, string memory _description) public{
        taskCounter++;
        tasks[taskCounter]=Task(taskCounter, _title, _description, false, block.timestamp);
        emit TaskCreated(taskCounter, _title, _description, false, block.timestamp);

    }

    function toggleDone(uint _id) public {
      Task memory _task = tasks[_id];
        _task.done = !_task.done;
        tasks[_id] = _task;
        emit TaskToggleDone(_id, _task.done);

    }
    
}


