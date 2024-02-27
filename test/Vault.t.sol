pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/Token.sol";
import {Vault, VaultStatus} from "../src/Vault.sol";

contract VaultTest is Test {
    Token token;
    Vault vault;

    uint256 capacity = 100;

    function setUp() public {
        token = new Token(1000);
        vault = new Vault(token, capacity);
    }

    function testInitializeNotFull() public {
        assertEq(token.balanceOf(address(vault)), 0);
        assertTrue(vault.status() == VaultStatus.NotFull);
    }

    function testFull() public {
        token.transfer(address(vault), capacity);
        vault.updateStatus();
        assertEq(token.balanceOf(address(vault)), capacity);
        assertTrue(vault.status() == VaultStatus.Full);
    }
}