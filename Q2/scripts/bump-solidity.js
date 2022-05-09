const fs = require("fs");
const solidityRegex = /pragma solidity \^\d+\.\d+\.\d+/

const verifierRegex = /contract Verifier/

let content = fs.readFileSync("./contracts/HelloWorldVerifier.sol", { encoding: 'utf-8' });
let bumped = content.replace(solidityRegex, 'pragma solidity ^0.8.0');
bumped = bumped.replace(verifierRegex, 'contract HelloWorldVerifier');

fs.writeFileSync("./contracts/HelloWorldVerifier.sol", bumped);

// [assignment] add your own scripts below to modify the other verifier contracts you will build during the assignment

function contractVersionBumper(contractName) {
    try{
        const inputFilePath = "./contracts/"+contractName+".sol";
        let content = fs.readFileSync(inputFilePath, { encoding: 'utf-8' });
        let bumped = content.replace(solidityRegex, 'pragma solidity ^0.8.0');
        bumped = bumped.replace(verifierRegex, 'contract '+contractName);

        fs.writeFileSync(inputFilePath, bumped);
    } catch {
        console.error("Issue while bumping solidity version for "+contractName);
    }
}

contractVersionBumper("Multiplier3Verifier");
contractVersionBumper("_plonkMultiplier3Verifier");