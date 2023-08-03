// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract wallet {

    PaymentReceived public payment;

    function payContract() public payable {
        payment = new PaymentReceived(msg.sender,msg.value);
    }

}

contract PaymentReceived {
    address public from;
    uint public amount;

    constructor(address _from, uint _amount) {
        from = _from;
        amount = _amount;
    }
}

contract wallet2 {

    struct PaymentReceivedStruct {
        address from;
        uint amount;
    }

    PaymentReceivedStruct public payment;

    function PayContract() public payable {
        payment.from = msg.sender;
        payment.amount = msg.value;
    }
}