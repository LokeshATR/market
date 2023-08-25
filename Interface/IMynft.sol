pragma solidity ^0.8.19;

// SPDX-License-Identifier: MIT
import "@openzeppelin/contracts/token/ERC721/IERC721.sol";

interface Imynft is IERC721 {
    function returnlistoftokens() external view returns (uint[] memory);
       function priceoftoken(uint tokenid) external view returns (uint);
}
