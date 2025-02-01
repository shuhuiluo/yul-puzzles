// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract IsPrime {
    function main(uint256 x) external pure returns (bool) {
        assembly {
            // your code here
            // return true if x is a prime number, else false
            // 1. check if the number is a multiple of 2 or 3
            // 2. loop from 5 to x / 2 to see if it is divisible
            // 3. increment the loop by 2 to skip the even numbers
            if eq(x, 1) {
                mstore(0, 0)
                return(0, 0x20)
            }
            if lt(x, 4) {
                mstore(0, 1)
                return(0, 0x20)
            }
            if iszero(and(x, 1)) {
                mstore(0, 0)
                return(0, 0x20)
            }
            let end := shr(1, x)
            for { let i := 3 } 1 { i := add(i, 2) } {
                if gt(i, end) { break }
                if iszero(mod(x, i)) {
                    mstore(0, 0)
                    return(0, 0x20)
                }
            }
            mstore(0, 1)
            return(0, 0x20)
        }
    }
}
