// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";


contract SecretNumberNFT is ERC721, Ownable {

    constructor(string memory _name, string memory _symbol) ERC721(_name, _symbol) Ownable(msg.sender) {}

    // Define the struct for the NFT data.
    struct TokenData {
        uint256 secretNumber;
    }
    uint256 public totalSupply;

    // Store the NFT data by token ID.
    mapping(uint256 => TokenData) private tokenData;

    // Mint a new NFT with a unique secretNumber.
    function mint() public onlyOwner {
        uint256 tokenId = totalSupply;
        TokenData memory data = TokenData(tokenId * 42);
        totalSupply += 1;
        tokenData[tokenId] = data;
        _mint(msg.sender, tokenId);
    }

    // Retrieve the secretNumber for a given token.
    function getSecretNumber(uint256 tokenId) public view returns (uint256) {
        require(_ownerOf(tokenId) != address(0), "Token does not exist");
        return tokenData[tokenId].secretNumber;
    }
}