// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract MappingwithDrwal {

    mapping (address=>uint) public balanceReceived;

    function SendMoney() public payable {
        balanceReceived[msg.sender] += msg.value;
    }

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }

    function withdrawlAllMoney (address payable _to) public {
        uint balanceToSendOut = balanceReceived[msg.sender];
        balanceReceived[msg.sender] = 0;
        _to.transfer(balanceToSendOut);
    }
}