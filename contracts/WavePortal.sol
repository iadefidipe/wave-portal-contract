// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0; // this is the version of solidity compiler we want to use

import "hardhat/console.sol"; // Some magic given to us by Hardhat to do some console logs in our contract.

// Once we initialize this contract for the first time, that constructor will run and print out that line
contract WavePortal {
    uint256 totalWaves; // this variable is special because it's called a "state variable" and it's cool because it's stored permanently in contract storage.

    constructor(){
        
        console.log("I am a contract and I am smart");
    } 

    function wave() public{
        totalWaves += 1;
        console.log("%S has waved!", msg.sender);
    }

    function getTotalWaves() public view returns (unit256){
        console.log("We have %d total waves!", totalWaves);
        return totalWaves;
    }
}


// The blockchain = Think of it as a cloud provider, kinda like AWS, but it's owned by no one. It's run by compute power from mining machines all over the world. Usually these people are called miners and we pay them to run our code!

// A smart contract = Kinda like our server's code with different functions people can hit.

// the public keyword: Think of this like a public API endpoint :).