// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import '@openzeppelin/contracts/token/ERC20/ERC20.sol';

contract Exchange is ERC20 {
    address public tokenAddress;

    // Exchange is inheriting ERC20, because our exchange itself is an ERC-20 contract
    // as it is responsible for minting and issuing LP Tokens
    constructor(address token) ERC20('ETH TOKEN LP Token', 'lpETHTOKEN') {
        require(token != address(0), 'Token address passed is a null address');
        tokenAddress = token;
    }

    /// @dev Balance of `token` for the exchange contract itself, i.e. how many `tokens` are in the exchange contract.
    /// @return uint256 representing the balance of `token` held by `this` contract
    function getReserve() public view returns (uint256) {
        return ERC20(tokenAddress).balanceOf(address(this));
    }
}
