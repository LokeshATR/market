pragma solidity ^0.8.19;

// SPDX-License-Identifier: MIT

// Import the ERC721 contract from OpenZeppelin
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "hardhat/console.sol";

contract Mynft is ERC721 {
    constructor() ERC721("openmarket", "omkt") {}

    function mint(uint tokenId) external {
        _mint(msg.sender, tokenId);
    }
}
