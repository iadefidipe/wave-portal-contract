// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0; // this is the version of solidity compiler we want to use

import "hardhat/console.sol"; // Some magic given to us by Hardhat to do some console logs in our contract.

// Once we initialize this contract for the first time, that constructor will run and print out that line
contract WavePortal {
    constructor(){
        console.log("I am a contract and I am smart");
    } 
}