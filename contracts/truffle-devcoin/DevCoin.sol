pragma solidity ^0.4.17;

contract DevCoin {
    mapping (address => uint) public balances;

    event Transfer(address from, address to, uint value);

    function DevCoin() public {
        balances [msg.sender] = 1000000;
    }

    function sendCoin(address receiver, uint amount) public returns (bool) {
        if(balances[msg.sender] < amount) return false;
        balances[msg.sender] -= amount;
        balances[receiver] += amount;
        Transfer(msg.sender, receiver, amount);
        return true;
    }



    function getBalance(address addr) public returns (uint) {
     return balances[addr];
    }
}
