// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract MaxOfArray {
    function main(uint256[] memory arr) external pure returns (uint256) {
        assembly {
            // your code here
            // return the maximum value in the array
            // revert if array is empty
            function max(a, b) -> r {
                let diff := xor(a, b)
                r := xor(b, mul(gt(a, b), diff))
            }

            if iszero(mload(arr)) { revert(0, 0) }
            let res := 0
            let ptr := add(arr, 0x20)
            let end := add(arr, shl(5, mload(arr)))
            for {} 1 { ptr := add(ptr, 0x20) } {
                res := max(res, mload(ptr))
                if eq(ptr, end) { break }
            }
            mstore(0, res)
            return(0, 0x20)
        }
    }
}
