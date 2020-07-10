pragma solidity ^0.5.1;

import "./Ownable.sol";

contract AccountSystem is Ownable{
    
    struct User {
        string name;
        uint[] stockHaving;
    }
    
    mapping(address => uint) users_index;
    User[] public users;
    
    function Register(address _useraddress) public returns(uint) {
        users_index[_useraddress] = users.length;
        return users.push(User("Default",new uint[](10))) - 1;
    }
    
    function UnRegister(address _useraddress) public {
        delete users_index[_useraddress];
    }
    
    function BuyStock(uint _stockindex, uint _stockamount) public payable {
        users[users_index[msg.sender]].stockHaving[_stockindex] += _stockamount;
    }
    
    function SellStock(address payable _useraddress, uint _stockindex, uint _stockamount, uint _stockprice) public payable {
        require(users[users_index[msg.sender]].stockHaving[_stockindex] >= _stockamount );
        _useraddress.transfer(_stockprice * _stockamount);
        users[users_index[_useraddress]].stockHaving[_stockindex] -= _stockamount;
    }
 }