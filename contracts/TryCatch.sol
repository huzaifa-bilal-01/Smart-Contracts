// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract WillThrow {
    error NotAllowedError(string);
    function afunction() public pure {
        //require(false, "Error Message");
        //assert(false);
        revert NotAllowedError("You are not Allowed!");
    }
}

contract ErrorHandling {
    event ErrorLogging(string reason);
    event ErrorLogCode(uint code);
    event ErrorLogBytes(bytes LowLevelData);
    function catchTheError() public {
        WillThrow will = new WillThrow();
        try will.afunction() {
            //add code if it works
        } catch Error(string memory reason) {
            emit ErrorLogging(reason);
        } catch Panic (uint errorCode){
            emit ErrorLogCode(errorCode);
        } catch(bytes memory lowLevelData) {
            emit ErrorLogBytes(lowLevelData);
        }
    }
}
