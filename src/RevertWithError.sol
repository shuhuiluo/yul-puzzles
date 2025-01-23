// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract RevertWithError {
    bytes4 internal constant ERROR_SELECTOR = 0x08c379a0;

    function main() external pure {
        assembly ("memory-safe") {
            // revert the function with an error of type `Error(string)`
            // use "RevertRevert" as error message
            // Hint: The error type is a predefined four bytes. See https://www.rareskills.io/post/try-catch-solidity
            mstore(0, ERROR_SELECTOR)
            mstore(0x04, 0x20) // abi encoding offset
            mstore(0x40, hex"0000000c526576657274526576657274") // length 12 and ascii "RevertRevert"
            revert(0, 0x50) // 0x50 = 0x04 + 0x20 + 0x20 + 0x0c
        }
    }
}
