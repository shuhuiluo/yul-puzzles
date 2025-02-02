// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract WriteToPackedDynamicArray64 {
    uint64[] public writeHere;

    function main(uint64 v1, uint64 v2, uint64 v3, uint64 v4, uint64 v5) external {
        assembly {
            // your code here
            // write the code to store v1, v2, v3, v4, and v5 in the `writeHere` array in sequential order.
            // Hint: `writeHere` is a dynamic array, so you will need to access its length and use `mstore` or `sstore`
            // appropriately to push new values into the array.
            sstore(writeHere.slot, 5)
            mstore(0, writeHere.slot)
            let arr := keccak256(0, 0x20)
            let val := or(shl(192, v4), or(shl(128, v3), or(shl(64, v2), v1)))
            sstore(arr, val)
            sstore(add(arr, 1), v5)
        }
    }
}
