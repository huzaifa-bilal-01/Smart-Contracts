// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract Sample {
    uint public myUint = 214;

    function setMyUint(uint _myUint) public {
        myUint = _myUint;
    }
}