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
        uint256 age;
        string email;
        uint256 timestamp;
    }
    mapping(address=>User) public userInformation;
    User[] public users;

    function createRegister(address user_, string memory name_, uint256 age_, string memory email_) public {  
        require(bytes(userInformation[user_].name).length == 0, "User already registered");
        
        User memory user = User({
            name: name_,
            age: age_,
            email: email_,
            timestamp: block.timestamp
        });
        userInformation[user_] = user;
        users.push(user);
    }

    function updateProfile(address user_, string memory name_, uint256 age_, string memory email_) public {                
        require(bytes(userInformation[user_].name).length != 0, "User not registered");
        User memory user = User({
            name: name_,
            age: age_,
            email: email_,
            timestamp: block.timestamp
        });
        userInformation[user_] = user;
        users.push(user);
    }

    function getProfile(address user_) public view returns (User memory) {
        return userInformation[user_];
    }
}