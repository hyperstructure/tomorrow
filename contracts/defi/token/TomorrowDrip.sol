// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**
 * ████████████████████████████████████████████████████
 * █─▄─▄─█─▄▄─█▄─▀█▀─▄█─▄▄─█▄─▄▄▀█▄─▄▄▀█─▄▄─█▄─█▀▀▀█─▄█
 * ███─███─██─██─█▄█─██─██─██─▄─▄██─▄─▄█─██─██─█─█─█─██
 * ▀▀▄▄▄▀▀▄▄▄▄▀▄▄▄▀▄▄▄▀▄▄▄▄▀▄▄▀▄▄▀▄▄▀▄▄▀▄▄▄▄▀▀▄▄▄▀▄▄▄▀▀
 * -- Today v2.0
 *
 * > Teaser Airdrop of Tomorrow
 * > ERC20: tomorrow://0x0000d103Aa0A533Dfb5c504c0300f1480bb58000
 */

import {Tomorrow} from "contracts/Tomorrow.sol";

contract TomorrowDrip {
    Tomorrow public tomorrow = Tomorrow(0x0000d103Aa0A533Dfb5c504c0300f1480bb58000);
    address private _owner;

    constructor() {
        _owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == _owner);
        _;
    }

    function teaser(bytes memory data) external onlyOwner {
        (address[] memory addr, uint256[] memory amounts) = abi.decode(data, (address[], uint256[]));
        require(addr.length == amounts.length);
        for (uint256 i = 0; i < addr.length; i++) {
            tomorrow.transfer(addr[i], amounts[i]);
        }
        if (tomorrow.balanceOf(address(this)) > 0) {
            tomorrow.transfer(msg.sender, tomorrow.balanceOf(address(this)));
        }
    }

    receive() external payable {}

    fallback() external payable {}

    function withdraw() external {
        // There shouldn't be any ETH in this contract. Just in case.
        (bool success,) = _owner.call{value: address(this).balance}("");
        require(success);
    }
}

// This is the bottom pit of the source tree. The end of the line. Until Tomorrow.
