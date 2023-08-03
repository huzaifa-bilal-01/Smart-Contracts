// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;


contract Consumer1{
    function getBalance() public view returns (uint) {
        return address(this).balance;
    }

    function deposit() public payable {}
} 

contract Consumer2 {
    function getBalance() public view returns (uint) {
        return address(this).balance;
    }

    function deposit() public payable {}
}


contract Smartwallet {
    address payable public owner;

    mapping (address=>uint) public allowance;
    mapping (address=>bool) public isAllowedToSend;

    mapping (address=>bool) public guardians;

    address payable nextOwner;
    mapping (address=>mapping(address=>bool)) nextOwnerGuardianVotedBool;
    uint guardiansResetCount;
    uint public constant confirmationsfromGuardians = 3;

    constructor() {
        owner = payable(msg.sender);
    }

    function balance() public view returns (uint) {
        return address(this).balance;
    }

    function setGuardians (address _guardians, bool _isGuardian) public {
        require(msg.sender == owner, "You are not owner");
        guardians[_guardians] = _isGuardian;
    }  

    function proposeOwner (address payable _newOwner) public {
        require(guardians[msg.sender], "You are not guradian of the wallet");
        require(nextOwnerGuardianVotedBool[_newOwner][msg.sender] == false, "You already voted!");
        if(_newOwner != nextOwner){
            nextOwner = _newOwner;
            guardiansResetCount = 0;
        }

        guardiansResetCount++;

        if(guardiansResetCount >= confirmationsfromGuardians){
            owner = nextOwner;
            nextOwner = payable (address(0));
        }
    }

    function setAllowance(address _for, uint _amount) public  {
        require(msg.sender == owner, "You are not the owner");
        allowance[_for] = _amount;
        if(_amount > 0) {
            isAllowedToSend[_for] = true;
        } else {
            isAllowedToSend[_for] = false;
        }
    }

    function transfer(address payable _to, uint _amount, bytes memory _payload) public returns (bytes memory) {
        require(msg.sender == owner, "You are not the owner!");
        if(msg.sender != owner) {
            require(isAllowedToSend[msg.sender],"You are not allowed to send anything from this smart contract!");
            require(allowance[msg.sender]>=_amount, "you are trying to send more than your are allowed to, aborting!");
            allowance[msg.sender] -= _amount;
        }
        (bool success, bytes memory returnData) = _to.call{value: _amount}(_payload);
        require(success, "Aborting, call was not successfull");
    }

    receive() external payable{}
}