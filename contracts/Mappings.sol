// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract Mappings {

    mapping (uint => bool) public myMapping;
    mapping (address => bool) public myAddressMapping;
    mapping (uint => mapping (uint=>bool)) public UintUintBoolMapping;

    function setValue(uint _var) public {
        myMapping[_var] = true;
    }

    function setMyAddressToTrue() public {
        myAddressMapping[msg.sender] = true;
    }

    function setUintUintBoolMapping (uint _key1, uint _key2, bool _value) public {
        UintUintBoolMapping[_key1][_key2] = _value; 
    }

}