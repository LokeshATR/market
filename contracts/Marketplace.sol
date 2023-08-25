pragma solidity ^0.8.19;
// SPDX-License-Identifier: MIT
import "../Interface/IMynft.sol";


contract Marketplace {
   
    Imynft Itoken;


    constructor(address ads) {
        Itoken = Imynft(ads);
    }

   

    function List(uint tokenID) external {
        Itoken.transferFrom(msg.sender,address(this),tokenID);
    }

    function totaltokensof(address ads) external view returns (uint) {
        return Itoken.balanceOf(ads);
    }

    function Buy(uint tokenId) external{
       Itoken.transferFrom(address(this),msg.sender,tokenId);
    }
  


}
