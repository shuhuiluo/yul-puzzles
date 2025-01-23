// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract DoubleOrNothing {
    function main(uint256 x) external pure returns (uint256) {
        assembly {
            // your code here
            // return 2 * x if the product is
            // 21 or less. If 2 * x > 21, then
            // return 0.
            // Hint: check if x ≤ 10, which is equivalent to x < 11
            // return x > 10 ? 0 : 2 * x;
            if gt(x, 10) {
                mstore(0, 0)
                return(0, 0x20)
            }
            x := shl(1, x)
            mstore(0, x)
            return(0, 0x20)
        }
    }
}
