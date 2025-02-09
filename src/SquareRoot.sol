// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract SquareRoot {
    function main(uint256 x) external pure returns (uint256) {
        assembly {
            // your code here
            // return the square root of x rounded down
            // e.g. root(4) = 2 root(5) = 2 root(6) = 2, ..., root(8) = 2, root(9) = 3
            // hint: https://www.youtube.com/watch?v=CnMBo5nG_zk
            // hint: use x / 2 as initial guess
            // hint: be careful of overflow
            // hint: use a switch statement to handle 0, 1, and the general case
            // hint: use break to exit the loop if the new guess is the same as the old guess
            if iszero(x) {
                mstore(0, 0)
                return(0, 0x20)
            }
            if lt(x, 4) {
                mstore(0, 1)
                return(0, 0x20)
            }
            let guess := shr(1, x)
            for {} 1 {} {
                let new_guess := shr(1, add(guess, div(x, guess)))
                if iszero(lt(new_guess, guess)) { break }
                guess := new_guess
            }
            mstore(0, guess)
            return(0, 0x20)
        }
    }
}
