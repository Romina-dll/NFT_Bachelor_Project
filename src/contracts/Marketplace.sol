// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "hardhat/console.sol";

contract Marketplace is ReentrancyGuard{

    //the account that receive fees 
    //payable means that this feeAccount can receive ethers
    //immutable means that they can asign a value once
    address payable public immutable feeAccount;
    //the fee percentage on sales
    uint public immutable feePercent;
    uint public itemCount = 0;


    struct Item {
        uint itemId;
        IERC721 nft;
        uint tokenId;
        uint price;
        address payable seller;
        bool sold;
    }

    event Offered (
        uint itemId ,
        address indexed nft ,
        uint tokenId ,
        uint price ,
        address indexed seller
    );

    event Buoght (
        uint itemId ,
        address indexed nft ,
        uint tokenId ,
        uint price , 
        address indexed seller, 
        address indexed buyer
    );
    

    //itemId -> Item
    mapping(uint => Item) public items;

    constructor(uint _feePercent){
        feeAccount = payable(msg.sender);
        feePercent = _feePercent;
    }

    function createItem(IERC721 _nft, uint _tokenId, uint _pirce ) external nonReentrant {
        require(_pirce > 0 , "Price must be greater that zero");
        itemCount++;
        _nft.transferFrom(msg.sender , address(this) , _tokenId);
        items [itemCount] = Item (
            itemCount ,
            _nft ,
            _tokenId ,
            _pirce ,
            payable(msg.sender) ,
            false
        );

        emit Offered(
            itemCount,
            address(_nft),
            _tokenId,
            _pirce , 
            msg.sender
        );
        
    }
    function purchaseItem(uint _itemId) external payable nonReentrant {
        uint _totalPrice = getTotalPrice(_itemId);
        Item storage item = items[_itemId]; 
        require(msg.value >= _totalPrice , "not enough ethers to cover item pirce and mareket fee");
        require(_itemId > 0 && _itemId <= itemCount , "item doesn't exist");
        require(!item.sold , "item already sold"); 
        item.seller.transfer(item.price);
        feeAccount.transfer(_totalPrice - item.price);  
        item.sold = true;
        item.nft.transferFrom(address(this), msg.sender, item.tokenId);

        emit Buoght(
            _itemId, 
            address(item.nft), 
            item.tokenId, 
            item.price, 
            item.seller, 
            msg.sender
        );       
    }

        
    function getTotalPrice (uint _itemId) view public returns(uint){
        return (items[_itemId].price * (100 - feePercent) / 100);
    }

}