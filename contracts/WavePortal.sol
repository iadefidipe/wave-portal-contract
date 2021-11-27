// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract WavePortal {
    uint256 totalWaves;

    
    event NewWave(address indexed from, uint256 timestamp, string message);

    
    struct Wave {
        address waver; // The address of the user who waved.
        string message; // The message the user sent.
        uint256 timestamp; // The timestamp when the user waved.
    }

  
    Wave[] waves;

    constructor() payable {
        console.log("I AM SMART CONTRACT. POG.");
    }

    
    function wave(string memory _message) public {
        totalWaves += 1;
        console.log("%s has waved!", msg.sender);

        waves.push(Wave(msg.sender, _message, block.timestamp));

        emit NewWave(msg.sender, block.timestamp, _message);

        uint256 prizeAmount = 0.0001 ether;
        require(
            prizeAmount <= address(this).balance,
            "Trying to withdraw more money than the contract has."
        );
        (bool success, ) = (msg.sender).call{value: prizeAmount}("");
        require(success, "Failed to withdraw money from contract.");
    }

    /*
     * I added a function getAllWaves which will return the struct array, waves, to us.
     * This will make it easy to retrieve the waves from our website!
     */
    function getAllWaves() public view returns (Wave[] memory) {
        return waves;
    }

    function getTotalWaves() public view returns (uint256) {
        // Optional: Add this line if you want to see the contract print the value!
        // We'll also print it over in run.js as well.
        console.log("We have %d total waves!", totalWaves);
        return totalWaves;
    }
}

// pragma solidity ^0.8.0; // this is the version of solidity compiler we want to use

// import "hardhat/console.sol"; // Some magic given to us by Hardhat to do some console logs in our contract.

// // Once we initialize this contract for the first time, that constructor will run and print out that line
// contract WavePortal {
//     uint256 totalWaves; // this variable is special because it's called a "state variable" and it's cool because it's stored permanently in contract storage.

//     event NewWave(address indexed from, uint256 timestamp, string message);

//     /*
//      * I created a struct here named Wave.
//      * A struct is basically a custom datatype where we can customize what we want to hold inside it.
//      */
//     struct Wave {
//         address waver; // The address of the user who waved.
//         string message; // The message the user sent.
//         uint256 timestamp; // The timestamp when the user waved.
//     }

//     /*
//      * I declare a variable waves that lets me store an array of structs.
//      * This is what lets me hold all the waves anyone ever sends to me!
//      */
//     Wave[] waves;

//     constructor() {
//         console.log("I am a contract and I am smart");
//     }

//     function wave() public {
//         totalWaves += 1;
//         console.log("%S has waved!", msg.sender);

//         waves.push(Wave(msg.sender, _message, block.timestamp)); // pushing required data to the wave array

//         emit NewWave(msg.sender, block.timestamp, _message);
//     }

//     /*
//      * the function getAllWaves which will return the struct array, waves, to us.
//      * This will make it easy to retrieve the waves from our website!
//      */
//     function getAllWaves() public view returns (Wave[] memory) {
//         return waves;
//     }

//     function getTotalWaves() public view returns (uint256) {
//         console.log("We have %d total waves!", totalWaves);
//         return totalWaves;
//     }
// }

// // The blockchain = Think of it as a cloud provider, kinda like AWS, but it's owned by no one. It's run by compute power from mining machines all over the world. Usually these people are called miners and we pay them to run our code!

// // A smart contract = Kinda like our server's code with different functions people can hit.

// // the public keyword: Think of this like a public API endpoint :).

// require which basically checks to see that some condition is true. If it's not true, it will quit the function and cancel the transaction. It's like a fancy if statement!
