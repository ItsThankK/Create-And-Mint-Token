// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract TkToken is ERC20 {

    address owner = msg.sender;

    constructor() ERC20("TkToken", "TkT") {
        // Mint initial supply to the contract deployer
        _mint(msg.sender, 10 * 10**decimals());
    }

    modifier onlyOwner {
        require(owner == msg.sender);
        _;
    }

    // Function to mint new tokens
    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    // Function to burn tokens
    function burn(uint256 amount) public {
        _burn(msg.sender, amount);
    }

    // Function to transfer tokens
    function transfer(address to, uint256 amount) public override returns (bool) {
        _transfer(msg.sender, to, amount);
        return true;
    }
}
