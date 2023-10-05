// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract deadmanSwitch{
    address owner;
    address payable toSend;
    uint lastBlock;
    uint check;

    constructor(address payable _toSend) {
        owner = msg.sender;
        lastBlock = block.number;
        toSend = _toSend;
    }

    function still_alive() public {
        require(msg.sender==owner);
        lastBlock = block.number;
    }
    function isDead() public{
        check = block.number - lastBlock;
        if(check >= 10){
        uint256 balance = address(this).balance;
        toSend.transfer(balance);
        }
    
    }
    
    }

