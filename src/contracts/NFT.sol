// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

contract NFT is ERC721URIStorage {
    //we want tokenCount to be read outside the contract
    uint public tokenCount = 0; 
    //call only once when the contract deployed to the blockChain
    constructor() ERC721("Shares NFT", "SH_FNT"){}
    //_tokenURI : the meta data of the NFT -> the link to the content of the NFT means the link that can be found from the ipfs
    //we want this function called from the outside but not within the contract -> external
    //return the id of the created token
    function mint(string memory _tokenURI) external returns(uint) {
        tokenCount ++;
        _safeMint(msg.sender, tokenCount);
        _setTokenURI(tokenCount, _tokenURI);
        return(tokenCount);
    }
}