// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract AbsoluteValue {
    function main(int256 x) external pure returns (uint256) {
        assembly {
            // your code here
            // return the absolute value of x
            // hint: use signed comparisons
            // hint: https://www.rareskills.io/post/signed-int-solidity
            let mask := sar(255, x)
            // If x >= 0, |x| = x = 0 ^ x
            // If x < 0, |x| = ~~|x| = ~(-|x| - 1) = ~(x - 1) = -1 ^ (x - 1)
            // Either case, |x| = mask ^ (x + mask)
            mstore(0, xor(mask, add(mask, x)))
            return(0, 0x20)
        }
    }
}
