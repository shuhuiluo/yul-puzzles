// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract BalanceOf {
    // emit these
    function main(address token) external view returns (uint256) {
        assembly {
            // your code here
            // return the balance of this contract using ERC20 "token"
            // assume "token" is an ERC20 contract
            // hint: balanceOf has function selector 0x70a08231 and signature "balanceOf(address)"
            // hint: since this is a view function, you should use staticcall
            // hint: use `returndatacopy` to copy the return data to the memory
            mstore(0, 0x70a08231)
            mstore(0x20, address())
            pop(staticcall(gas(), token, 0x1c, 0x24, 0, 0x20))
            return(0, 0x20)
        }
    }
}
