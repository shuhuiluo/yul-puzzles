// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract WriteTwoDynamicArraysToStorage {
    uint256[] public writeHere1;
    uint256[] public writeHere2;

    function main(uint256[] calldata x, uint256[] calldata y) external {
        assembly {
            // your code here
            // write the dynamic calldata array `x` to storage variable `writeHere1` and
            // dynamic calldata array `y` to storage variable `writeHere2`
            sstore(writeHere1.slot, x.length)
            mstore(0, writeHere1.slot)
            let arr := keccak256(0, 0x20)
            for { let i := 0 } lt(i, x.length) { i := add(i, 1) } {
                sstore(add(arr, i), calldataload(add(x.offset, shl(5, i))))
            }
            sstore(writeHere2.slot, y.length)
            mstore(0, writeHere2.slot)
            arr := keccak256(0, 0x20)
            for { let i := 0 } lt(i, y.length) { i := add(i, 1) } {
                sstore(add(arr, i), calldataload(add(y.offset, shl(5, i))))
            }
        }
    }
}
