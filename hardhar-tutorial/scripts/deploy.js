const { ethers } = require("hardhat");

async function main(){
    /*
        A contractFactory  in ethers.js is an abstraction used to deploy new smart contracts,
        so whitelistcontract here is a factory for instance of our Whitelist contract.

    */

    const whitelistContract = await ethers.getContractFactory("Whitelist");

    //here we deploy the contract

    const deployedWhitelistContract = await whitelistContract.deploy(10);
    //10 is the maximum no. of whitelisted addresses allowed!

    //wait for it to finish deploying

    await deployedWhitelistContract.deployed();

    //print the address of t he deployed contract
    console.log("WhielistContrac aDDRESS: ", deployedWhitelistContract.address);


}

//Call the main function and catch errors if any

main()
    .then(()=> process.exit(0))
    .catch((error)=> {
        console.log(error);
        process.exit(1);
    })