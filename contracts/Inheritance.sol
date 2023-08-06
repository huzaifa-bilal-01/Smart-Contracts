// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import "./OnlyForOwner.sol";

contract InheritanceExample is ForOwner {

    mapping (address=>uint) public tokenBalnace;

    constructor() {
        tokenBalnace[owner] = 100;
    }

    

    function addTokens() public onlyOwner {
        tokenBalnace[msg.sender]++;
    }

    function burnTokens() public onlyOwner {
        tokenBalnace[msg.sender]--;
    }

    function sendToken(address _to, uint _amount) public {
        require(tokenBalnace[msg.sender] >= _amount, "Not enought Tokens!");
        tokenBalnace[msg.sender] -= _amount;
        tokenBalnace[_to] += _amount;
    }
    
}