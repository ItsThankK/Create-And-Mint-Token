// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract MyToken {

    // public variables here
    address owner;

    string public tokenName = "MyToken";
    string public tokenSymbol = "MT";
    uint public totalSupply = 0;

    // mapping variable here
    mapping(address => uint) public balances;

    constructor() {
        owner = msg.sender;
    }

    // Mint function
    function mintMyToken(uint _value) public {
        
        require(owner == msg.sender,"ONLY OWNER CAN MINT!!!");
        totalSupply += _value;
        balances[msg.sender] += _value;
    }

    // Burn function
    function burnMytoken(uint _value) public {
        require(balances[msg.sender] >= _value, "INSUFFICIENT FUNDS!!!");
        totalSupply -= _value;
        balances[msg.sender] -= _value;
    }

    // Transfer function
    function transferMyToken(address payable recipient, uint256 amount) public payable{
        require(balances[msg.sender] >= amount, "INSUFFICIENT FUNDS!!!");
        balances[msg.sender] -= amount;
        balances[recipient] += amount;
    }


}