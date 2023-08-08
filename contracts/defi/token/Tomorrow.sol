// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**
 * ████████████████████████████████████████████████████
 * █─▄─▄─█─▄▄─█▄─▀█▀─▄█─▄▄─█▄─▄▄▀█▄─▄▄▀█─▄▄─█▄─█▀▀▀█─▄█
 * ███─███─██─██─█▄█─██─██─██─▄─▄██─▄─▄█─██─██─█─█─█─██
 * ▀▀▄▄▄▀▀▄▄▄▄▀▄▄▄▀▄▄▄▀▄▄▄▄▀▄▄▀▄▄▀▄▄▀▄▄▀▄▄▄▄▀▀▄▄▄▀▄▄▄▀▀
 * -- Today v2.0
 *
 * > Tomorrow ERC20 Token
 * > ERC20: tomorrow://0x0000d103Aa0A533Dfb5c504c0300f1480bb58000
 */

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Tomorrow is ERC20 {
    constructor() ERC20("Tomorrow", "TOMORROW") {
        _mint(msg.sender, 100_000_000_000 ether);
    }
}
