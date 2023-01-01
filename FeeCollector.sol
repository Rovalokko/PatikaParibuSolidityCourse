pragma solidity ^0.8.17;
//SPDX-License-Identifier: MIT
contract FeeCollector {
    address public owner; 
    uint256 public balance; //balance of the contract

    constructor(){
        owner = msg.sender; //contract owner
    }
    recieve () payable external{ //putting eth in contract
    balance += msg.value; //total amount in balance
    }
    function withdraw(uint amount, address payable destAddr) public { //withdrawing eth from contract
        require(msg.sender == owner, "Only owner can withdraw"); //making this function for only owner
        require(amount >= balance, "Insufficient funds"); //if you try to withdraw more then the balance
        
        destAddr.transfer(amount); //eths will go to the address
        balance -=amount; /balance change after the withdraw-function
    }
}
