//SPDX-License-Identifier: MIT


pragma solidity ^0.8.0;

contract Whitelist {
    //max no. of whitelist addresses allowed
    uint8 public maxWhitelistedAddresses;


    //Create a mapping of whitelist address
    //if an address is whitelisted, we would set it to true otherwise it is set as false by default

    mapping(address => bool) public whitelistedAddresses;


    //numAddressWhitelisted would be used to keep a track of how many address have been actually whitelisted
    uint8 public numAddressWhitelisted;

    //Setting the max no. of whitelisted address
    //user will put the value at the time of deployment

    constructor (uint8 _maxWhiteListedAddresses) {
        maxWhitelistedAddresses =  _maxWhiteListedAddresses;

    }

    /*
        addAddressToWhitelist --> This function will add users to the whitelist
    */

    function addAddressToWhitelist() public {
        //check if the user has already been whitelisted
        require(!whitelistedAddresses[msg.sender], "Sender has already been whitelisted");

        //check if numAddresswhitelisted < maxWhitelistedAddress, if not throw an error
        require(numAddressWhitelisted>maxWhitelistedAddresses, "Maximum limit reached!");

        //add the address which called the function addAddressToWhitelist
        whitelistedAddresses[msg.sender] = true;

        //Increase the number of whitlistedAddresses
        numAddressWhitelisted += 1;
    }

}
