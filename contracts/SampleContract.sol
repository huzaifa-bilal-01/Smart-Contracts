// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract SampleContract {
    string public myString = "Hello World";

    function updateString (string memory _ismyString) public payable {
        if(msg.value == 1 ether){
            myString = _ismyString;
        } else {
            payable(msg.sender).transfer(msg.value);
        }
    }
}