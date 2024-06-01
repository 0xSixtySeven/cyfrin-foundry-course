// SPDX-License-Identifier: MIT

pragma solidity ^0.8.25;

import {Test, console} from "../lib/forge-std/src/Test.sol";
import {FundMe} from "../src/FundMe.sol";

contract FundMeTest is Test {
    FundMe fundMe; // FundMe fundMe means: FundMe is a type, fundMe is a variable.

    function setUp() external {
        fundMe = new FundMe(msg.sender);
    }

    function testMinimumDollarIsFive() public view {
        assertEq(fundMe.MINIMUM_USD(), 5e18);
    }

    function testIfSenderIsOwner() public view {
        console.log(fundMe.i_owner());
        console.log(msg.sender);
        console.log(address(this));

        assertEq(fundMe.i_owner(), address(this)); // We have to put address(this) because the owner is the contract itself. msg.sender is the owner only when fundMe is deployed.
    }
}
