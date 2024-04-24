// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {console} from "forge-std/Test.sol";

contract Expiry {
    uint256 public expiry;

    constructor() {
        expiry = block.timestamp;
    }

    function setExpiry(uint256 _expiry) public {
        console.log("Expiry.setExpiry: block.timestamp = %s", block.timestamp);
        console.log("Expiry.setExpiry: expiry (before) = %s", expiry);
        expiry = _expiry;
        console.log("Expiry.setExpiry: expiry (after) = %s", expiry);
    }

    function isExpired() public view returns (bool) {
        console.log("Expiry.isExpired: block.timestamp = %s", block.timestamp);
        console.log("Expiry.isExpired: expiry = %s", expiry);

        return block.timestamp >= expiry;
    }
}
