pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/Token.sol";

contract TokenTest is Test {
    Token public token;

    function setUp() public {
        token = new Token(100);
    }

    function testConstructorMint() public {
        assertEq(token.balanceOf(address(this)), 100);
    }

    function testMint(uint256 amount) public {
        vm.assume(amount < 1 ether);
        token.mint(amount, msg.sender);
        assertEq(token.balanceOf(msg.sender), amount);
    }

    function testFailMint(uint256 amount) public {
        vm.assume(amount > 1 ether);
        token.mint(amount, msg.sender);
    }
}