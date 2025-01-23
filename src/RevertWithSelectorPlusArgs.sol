// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract RevertWithSelectorPlusArgs {
    error RevertData(uint256); // selector: 0xae412287

    bytes4 internal constant ERROR_SELECTOR = 0xae412287;

    function main(uint256 x) external pure {
        assembly ("memory-safe") {
            // your code here
            // revert custom error with x parameter
            // Hint: concatenate selector and x by storing them
            // adjacent to each other in memory
            mstore(0, ERROR_SELECTOR)
            mstore(0x04, x)
            revert(0, 0x24)
        }
    }
}
