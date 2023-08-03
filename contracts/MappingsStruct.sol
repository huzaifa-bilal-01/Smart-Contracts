// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract MappingStruct {
 
     struct Transaction {
         uint amount;
         uint timestamp;
     }

     struct Balance {
         uint totalBalance;
         uint numDeposits;
         mapping (uint=>Transaction) deposits;
         uint numWithDrawls;
         mapping (uint=>Transaction) withdrawls;
     }

     mapping (address=>Balance) public balances;

     function fetDepositsNum (uint _numDeposit, address _from) public view returns (Transaction memory) {
         return balances[_from].deposits[_numDeposit];
     }

     function depositMoney() public payable {
         balances[msg.sender].totalBalance += msg.value;
         Transaction memory deposit = Transaction(msg.value,block.timestamp);
         balances[msg.sender].deposits[balances[msg.sender].numDeposits] = deposit;
         balances[msg.sender].numDeposits++;
     }

     function withDrawlMoney(uint _amount, address payable _to) public {
         balances[msg.sender].totalBalance -= _amount;
         Transaction memory withdrawl = Transaction(_amount,block.timestamp);
         balances[msg.sender].withdrawls[balances[msg.sender].numWithDrawls] = withdrawl;
         balances[msg.sender].numWithDrawls++;

         _to.transfer(_amount);
     }

}