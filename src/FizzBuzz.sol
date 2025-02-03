// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract FizzBuzz {
    function main(uint256 num) external pure returns (string memory) {
        assembly {
            // your code here
            // if `num` is divisible by 3 return the word "fizz",
            // if divisible by 5 with the word "buzz",
            // if divisible by both 3 and 5 return the word "fizzbuzz",
            // else return an empty string "".

            // Assume `num` is greater than 0.
            mstore(0, 0x20)
            if iszero(mod(num, 15)) {
                mstore(0x20, 8)
                mstore(0x40, "fizzbuzz")
                return(0, 0x60)
            }
            if iszero(mod(num, 3)) {
                mstore(0x20, 4)
                mstore(0x40, "fizz")
                return(0, 0x60)
            }
            if iszero(mod(num, 5)) {
                mstore(0x20, 4)
                mstore(0x40, "buzz")
                return(0, 0x60)
            }
            mstore(0x20, 0)
            return(0, 0x40)
        }
    }
}
