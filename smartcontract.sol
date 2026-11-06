
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract ToDoList {

    struct Task {
        string description;
        bool completed;
    }

    // Each wallet has its own list of tasks
    mapping(address => Task[]) private tasks;

    // Function 1: Add a new task (WRITE)
    function addTask(string memory _description) public {
        require(bytes(_description).length > 0, "Task cannot be empty");

        tasks[msg.sender].push(Task(_description, false));
    }

    // Function 2: View all your tasks (READ)
    function getMyTasks() public view returns (Task[] memory) {
        return tasks[msg.sender];
    }

    // Function 3: Mark a task as completed (WRITE)
    function toggleTask(uint256 _taskIndex) public {
        require(_taskIndex < tasks[msg.sender].length, "Invalid task index");

        tasks[msg.sender][_taskIndex].completed =
            !tasks[msg.sender][_taskIndex].completed;
    }

    // Function 4: Count your tasks (READ)
    function getTaskCount() public view returns (uint256) {
        return tasks[msg.sender].length;
    }
}
