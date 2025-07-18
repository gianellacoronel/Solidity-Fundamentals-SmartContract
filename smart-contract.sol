// Create a smart contract that allows users to register and update 
//      their profile information ( name, age, email etc).

// Functions: Create register(), updateProfile(), getProfile()

// Requirements:
// * Use a struct named User
// * Store data in state variables
// * Include public getter function
// * Validate that user cannot register twice
// * Add a view function to fetch user info
// * Track registration timestamp using uint


// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

contract UserInformation {
    
    struct User {
        string name;
        uint age;
        string email;
    }
    mapping(address=>User) public userInformation;

    
}