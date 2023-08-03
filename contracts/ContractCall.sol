// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract ContractOne {
    mapping (address => uint) public adressBalance;

    function deposit() public payable {
        adressBalance[msg.sender] += msg.value;
    }

    receive() external payable {
        deposit();
    }
}

contract ContractTwo {
    receive() external payable {
    
    }

    function depositContractOne(address _contractone) public {
        //bytes memory payload = abi.encodeWithSignature("deposit()");
        (bool success, ) = _contractone.call{value:10, gas:100000}("");
        require(success);
    }

}