// Identify and fix the vulnerabilities in this simple smart contract to make it secure. Add your custom attack function to attack the smart contract and call the withdraw function.
// Submit the repo link to your audited source code

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

//contract VulnerablePiggyBank {
contract NewInvulnerablePiggyBank {
    address public owner;
    bool private locked;

    constructor() {
        owner = msg.sender;
        locked = false;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not the owner");
        _;
    }

    modifier noReentrancy() {
        require(!locked, "Reentrancy blocked");
        locked = true;
        _;
        locked = false;
    }

    function deposit() public payable {}

    function withdraw() public onlyOwner noReentrancy {
        payable(msg.sender).transfer(address(this).balance);
    }

    function attack() public {
        withdraw();
    }
}