pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "forge-std/console.sol";
import {Token} from "../src/Token.sol";
import {Vault} from "../src/Vault.sol";

contract VaultDeploy is Script {
    function run() public {
        uint256 deployer = vm.envUint("PRIVATE_KEY");

        // address account = vm.addr(deployer);
        // console.log("Account", account);
        
        vm.startBroadcast(deployer);

        Token token = new Token(1000);
        new Vault(token, 500);  

        vm.stopBroadcast();
    }
}