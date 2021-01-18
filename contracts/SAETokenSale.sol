pragma solidity ^0.5.16;

import "./SAEToken.sol";

contract SAETokenSale {
    address admin;
    SAEToken public tokenContract;
    uint256 public tokenPrice;
    uint256 public tokensSold;

    event Sell(address _buyer, uint256 _amount);

    // Constructor
    constructor (SAEToken _tokenContract, uint256 _tokenPrice) public {
        admin = msg.sender;
        tokenContract = _tokenContract;
        tokenPrice = _tokenPrice;
    }
    function multiply(uint x, uint y) internal pure returns (uint z) {
        require(y == 0 || (z = x * y) / y == x);
    }

    function buyTokens(uint256 _numberOfTokens) public payable {
        require(msg.value == multiply(_numberOfTokens, tokenPrice));
        require(address(tokenContract).balance >= _numberOfTokens);
        require(tokenContract.transfer(msg.sender, _numberOfTokens));

        tokensSold += _numberOfTokens;

        emit Sell(msg.sender, _numberOfTokens);
    }

    //ending token SAETokenSale
    function endSale() public {
        require(msg.sender == admin);
        require(tokenContract.transfer(admin, address(tokenContract).balance));

        //selfdestruct(msg.sender);
    }
}