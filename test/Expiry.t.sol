// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Expiry} from "../src/Expiry.sol";

contract ExpiryTest is Test {
    Expiry public e;

    function setUp() public {
        e = new Expiry();
    }

    function test_Expiry() public {
        console.log("ExpiryTest: block.timestamp = %s", block.timestamp);
        e.setExpiry(block.timestamp + 1 days);
        assertFalse(e.isExpired());
        skip(1 days);
        console.log("ExpiryTest: block.timestamp = %s", block.timestamp);
        assertTrue(e.isExpired());
    }
}
