// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract Log2 {
    function main(uint256 x) external pure returns (uint256) {
        assembly {
            // your code here
            // return log2 of x rounded down
            // revert if x is 0
            // hint: log2 is the index of the highest bit that is set in x
            // for example:
            //   bin(1) = 0001, so log2(2) = 0
            //   bin(2) = 0010, so log2(2) = 1
            //   bin(3) = 0011, so log2(3) = 1
            //   bin(4) = 0100, so log2(4) = 2
            //   bin(5) = 0101, so log2(5) = 2
            //   bin(6) = 0110, so log2(6) = 2
            //   bin(7) = 0111, so log2(6) = 2
            //   bin(8) = 1000, so log2(6) = 3
            if iszero(x) { revert(0, 0) }
            let r := shl(7, lt(0xffffffffffffffffffffffffffffffff, x))
            r := or(r, shl(6, lt(0xffffffffffffffff, shr(r, x))))
            r := or(r, shl(5, lt(0xffffffff, shr(r, x))))
            r := or(r, shl(4, lt(0xffff, shr(r, x))))
            r := or(r, shl(3, lt(0xff, shr(r, x))))
            r := or(r, shl(2, lt(0xf, shr(r, x))))
            r := or(r, shl(1, lt(0x3, shr(r, x))))
            r := or(r, shr(1, shr(r, x)))
            mstore(0, r)
            return(0, 0x20)
        }
    }
}
