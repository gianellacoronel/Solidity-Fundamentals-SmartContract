// Build a simple Vault system that allows users to deposit and withdraw Ether.
//  Requirements:
//  - Use a Library for math
//  - Emit an Event when a user deposits or withdraws.
//  - Use require() or revert() to prevent over-withdrawing ETH or depositing 0 ETH
//  - Implement Inheritance:
//  - Base contract: VaultBase (defines structure and shared logic)
//  - Derived contract: VaultManager (implements deposit/withdraw functions


// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

library VaultMathLib {
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        return a + b;
    }

    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b <= a, "Subtraction underflow");
        return a - b;
    }
}

contract VaultBase {
    mapping(address => uint256) internal balances;

    event Deposited(address user, uint256 amount);
    event Withdrawn(address user, uint256 amount);

    function getBalance(address user) public view returns (uint256) {
        return balances[user];
    }
}

contract VaultManager is VaultBase {
    using VaultMathLib for uint256;

    // Deposit ETH into the vault
    function deposit() public payable {
        require(msg.value > 0, "Cannot deposit 0 ETH");

        balances[msg.sender] = balances[msg.sender].add(msg.value);
        emit Deposited(msg.sender, msg.value);
    }

    // Withdraw ETH from the vault
    function withdraw(uint256 amount) public {
        require(amount > 0, "Amount must be greater than 0");
        uint256 userBalance = balances[msg.sender];
        require(userBalance >= amount, "Not enough balance");

        balances[msg.sender] = userBalance.sub(amount);
        payable(msg.sender).transfer(amount);
        emit Withdrawn(msg.sender, amount);
    }
}