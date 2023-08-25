pragma solidity ^0.8.19;

// SPDX-License-Identifier: MIT

// Import the ERC721 contract from OpenZeppelin
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "hardhat/console.sol";

contract Mynft is ERC721 {
    struct tokendetails {
        address owner;
        uint price;
    }

    mapping(uint => tokendetails) tokendetailsbyid;
    uint[] tokensavaialble;

    constructor() ERC721("openmarket", "omkt") {}

    function mint(uint tokenId, uint price) external {
        _mint(msg.sender, tokenId);
        tokensavaialble.push(tokenId);
        tokendetailsbyid[tokenId].owner = msg.sender;
        tokendetailsbyid[tokenId].price = price;
    }

    function returnlistoftokens() external view returns (uint[] memory){
        return tokensavaialble;
    }

    function priceoftoken(uint tokenid) external view returns  (uint){
        return tokendetailsbyid[tokenid].price;
    }
}
