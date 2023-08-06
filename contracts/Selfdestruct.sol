// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract SelfDestruct {

    receive() external payable {}

    function selfDestroy() public {
        selfdestruct(payable (msg.sender));
    }
    
}