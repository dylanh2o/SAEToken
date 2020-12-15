pragma solidity ^0.5.16;

contract SAEToken {
    //Name
    string public name = "SAE Token";
    //Symbol
    string public symbol = "SAE";
    string public standard = "SAE Token v1.0";
    uint256 public totalSupply;

    event Transfer(
        address indexed _from,
        address indexed _to,
        uint256 _value
    );

    mapping(address => uint256) public balanceOf;

    // Constructor
    constructor (uint256 _initialSupply) public {
        balanceOf[msg.sender] = _initialSupply;
        totalSupply = _initialSupply;
    }
    //transfer
    function transfer(address _to, uint256 _value) public returns (bool success) {
        //Exception if account does't have enough
        require(balanceOf[msg.sender] >= _value);
        //Transfer the balance
        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;
        //Transfer Event
        emit Transfer(msg.sender, _to, _value);
        //return a boolean
        return true;
    }
}