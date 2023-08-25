pragma solidity ^0.8.19;
// SPDX-License-Identifier: MIT
import "../Interface/IMynft.sol";

import "hardhat/console.sol";

contract Marketplace {
    Imynft Itoken;
    uint[] public availabletoken;

    struct abouttoken {
        address  owner;
        uint price;
    }

    mapping(uint => abouttoken) tokenmap;

    constructor(address ads) {
        Itoken = Imynft(ads);
    }

    function List(uint tokenID, uint price) external {
        Itoken.transferFrom(msg.sender, address(this), tokenID);
        availabletoken.push(tokenID);
        tokenmap[tokenID].price = price ;
        tokenmap[tokenID].owner = msg.sender;
    }

    function totaltokensof(address ads) external view returns (uint) {
        return Itoken.balanceOf(ads);
    }

    function Buy(uint tokenId) external payable returns(bool){
        require(
            msg.value >= tokenmap[tokenId].price,'you dont have enough ethers');
    
        Itoken.transferFrom(address(this), msg.sender, tokenId);
        address payable recipient = payable(tokenmap[tokenId].owner);
        bool success =recipient.send(tokenmap[tokenId].price);
    
        tokenmap[tokenId].owner = msg.sender;
      return success;
    }
 
}
