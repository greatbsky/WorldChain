pragma solidity ^0.4.18;

// This is a base library.

library Base{
	function convert(uint amount, uint conversionRate) public pure returns (uint convertedAmount)
	{
		return amount * conversionRate;
	}
}
