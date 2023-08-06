// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract Verification {

    mapping (address=>uint) public balance;

    constructor() {
        balance[msg.sender] = 100;
    }

    function sendBalance(address _to, uint _amount) public {
        balance[msg.sender] -= _amount;
        balance[_to] += _amount;
    }

}