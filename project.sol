// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "ERC20.sol";

contract Mtoken is ERC20 {
    address owner = msg.sender;
    modifier onlyOwner { 
        require (owner == msg.sender, "only owner can access");
        _;
    }

    constructor(string memory name_of_token, string memory symbol_of_token) ERC20(name_of_token, symbol_of_token) onlyOwner{
        // Mint 100 tokens to msg.sender
        // Similar to how
        // 1 dollar = 100 cents
        // 1 token = 1 * (10 ** decimals)
        _mint(msg.sender, 1000 * 10**uint(decimals()));
    }
    function send_token(address address_of_token,uint256 number_of_token) external  {
        _transfer(msg.sender, address_of_token, number_of_token);
    }
    function burn_token(address address_of_token, uint256 number_of_token) external {
        burn(address_of_token, number_of_token);
    }
}
