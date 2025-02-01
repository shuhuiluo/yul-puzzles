// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract WriteToFixedArray {
    uint256[5] writeHere;

    function main(uint256[5] memory x) external {
        assembly {
            // your code here
            // store the values in the fixed array `x` in the storage variable `writeHere`
            // Hint: https://www.rareskills.io/post/solidity-dynamic
            sstore(writeHere.slot, mload(x))
            sstore(add(writeHere.slot, 1), mload(add(x, 0x20)))
            sstore(add(writeHere.slot, 2), mload(add(x, 0x40)))
            sstore(add(writeHere.slot, 3), mload(add(x, 0x60)))
            sstore(add(writeHere.slot, 4), mload(add(x, 0x80)))
        }
    }

    function getter() external view returns (uint256[5] memory) {
        return writeHere;
    }
}
