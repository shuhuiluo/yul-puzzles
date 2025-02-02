// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract WriteToPacked64 {
    uint64 public someValue1 = 7;
    uint64 public writeHere = 1;
    uint64 public someValue2 = 7;
    uint64 public someValue3 = 7;

    function main(uint256 v) external {
        assembly {
            // your code here
            // change the value of `writeHere` storage variable to `v`
            // be careful not to alter the value of `someValue` variable
            let mask_below_someValue2 := sub(shl(shl(3, someValue2.offset), 1), 1)
            let mask_below_writeHere := sub(shl(shl(3, writeHere.offset), 1), 1)
            let mask := sub(mask_below_someValue2, mask_below_writeHere)
            let rest := and(sload(writeHere.slot), xor(not(0), mask))
            sstore(writeHere.slot, or(rest, and(mask, shl(64, v))))
        }
    }
}
