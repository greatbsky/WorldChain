pragma solidity ^0.4.17;

contract TestCoin {

    // 关键字“public”使变量能从合约外部访问。
    address public minter;
    mapping (address => uint) public balances;

    // 事件让轻客户端能高效的对变化做出反应。
    event Sent(address from, address to, uint amount);

    // 这个构造函数的代码仅仅只在合约创建的时候被运行。
    function TestCoin() public {
        minter = msg.sender;
    }

    // 合约创建者可以调用mint
    function mint(address receiver, uint amount) public {
        if (msg.sender != minter) return;
        balances[receiver] += amount;
    }

    // send可以被拥有代币的任何人调用
    // send是关键词，方法名不能用send参见https://ethereum.stackexchange.com/questions/12120/not-enough-funds-for-a-transaction-example-in-testrpc
    function sendCoin(address receiver, uint amount) public returns(bool sufficient) {
        if (balances[msg.sender] < amount) return false;
        balances[msg.sender] -= amount;
        balances[receiver] += amount;
        Sent(msg.sender, receiver, amount);
        return true;
    }


	function getBalanceInEth(address addr) public view returns(uint){
        return getBalance(addr) * 2;
	}

	function getBalance(address addr) public view returns(uint) {
		return balances[addr];
	}
}
