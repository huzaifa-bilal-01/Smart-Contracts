// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract Mapping {
    
    mapping (address=>uint) public tokenBalance;

    event TokensSent (address _from, address _to, uint _amount);
    constructor() {
        tokenBalance[msg.sender] = 100;
    }

    function sendToken(address _to, uint _amount) public returns (bool) {
        require(tokenBalance[msg.sender] >= _amount, "Not enough funds!");
        tokenBalance[msg.sender] -= _amount;
        tokenBalance[_to] += _amount;

        emit TokensSent(msg.sender, _to, _amount);

        return true;
    }

}