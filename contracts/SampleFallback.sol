// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract SampleFallback {
    uint public lastValueSent;
    string public lastFunctionCalled;
    uint public myUint;

    function setMyUint(uint _myUint) public {
        myUint = _myUint;
    }
// 0xe492fd840000000000000000000000000000000000000000000000000000000000000001
    receive() external payable {
        lastValueSent = msg.value;
        lastFunctionCalled = "receive";
    }

    fallback() external payable  {
        lastValueSent = msg.value;
        lastFunctionCalled = "fallback";
    }

}