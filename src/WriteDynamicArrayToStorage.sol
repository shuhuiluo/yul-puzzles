// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract WriteDynamicArrayToStorage {
    uint256[] public writeHere;

    function main(uint256[] calldata x) external {
        assembly {
            // your code here
            // write the dynamic calldata array `x` to storage variable `writeHere`
            sstore(writeHere.slot, x.length)
            mstore(0, writeHere.slot)
            let arr := keccak256(0, 0x20)
            for { let i := 0 } lt(i, x.length) { i := add(i, 1) } {
                sstore(add(arr, i), calldataload(add(x.offset, shl(5, i))))
            }
        }
    }
}
