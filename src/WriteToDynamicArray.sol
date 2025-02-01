// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract WriteToDynamicArray {
    uint256[] writeHere;

    function main(uint256[] memory x) external {
        assembly {
            // your code here
            // store the values in the DYNAMIC array `x` in the storage variable `writeHere`
            // Hint: https://www.rareskills.io/post/solidity-dynamic
            // store the length
            sstore(writeHere.slot, mload(x))
            mstore(0, writeHere.slot)
            let arr := keccak256(0, 0x20)
            let ptr := add(x, 0x20)
            let end := add(ptr, shl(5, mload(x)))
            for { let i := 0 } 1 {} {
                if eq(ptr, end) { break }
                sstore(add(arr, i), mload(ptr))
                ptr := add(ptr, 0x20)
                i := add(i, 1)
            }
        }
    }

    function getter() external view returns (uint256[] memory) {
        return writeHere;
    }
}
