// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract Approve {
    // emit these
    function main(address token, uint256 amount) external {
        assembly {
            // your code here
            // approve "token" to spend "amount"
            // hint: approve has function selector 0x095ea7b3 and signature "approve(address,uint256)"
            mstore(0, 0x095ea7b3)
            mstore(0x20, token)
            mstore(0x40, amount)
            pop(call(gas(), token, 0, 0x1c, 0x44, 0, 0))
        }
    }
}
