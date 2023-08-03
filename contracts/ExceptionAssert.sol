// SPDX-License-Identifier: MIT
pragma solidity 0.7.0;

contract ExceptionAssert {
    mapping (address => uint8) public balanceReceived;

    function receiveMoney() public payable {
        require(msg.value == uint8(msg.value), "Not in the range of 0-256");
        balanceReceived[msg.sender] += uint8(msg.value);
    }

    function withdrawMoney(address payable _to, uint8 _amount) public {
        require(_amount <= balanceReceived[msg.sender], "Not enough funds!");
        balanceReceived[msg.sender] -= _amount;
        _to.transfer(_amount);
    }
} 