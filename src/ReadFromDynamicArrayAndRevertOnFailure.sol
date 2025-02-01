// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract ReadFromDynamicArrayAndRevertOnFailure {
    uint256[] readMe;

    function setValue(uint256[] calldata x) external {
        readMe = x;
    }

    function main(int256 index) external view returns (uint256) {
        assembly {
            // your code here
            // read the value at the `index` in the dynamic array `readMe`
            // and return it
            // Revert with Solidity panic on failure, use error code 0x32 (out-of-bounds or negative index)
            // Hint: https://www.rareskills.io/post/solidity-dynamic
            let len := sload(readMe.slot)
            if iszero(lt(index, len)) {
                mstore(0, hex"4e487b71")
                mstore(0x04, 0x32)
                revert(0, 0x24)
            }
            mstore(0, readMe.slot)
            let arr := keccak256(0, 0x20)
            mstore(0, sload(add(arr, index)))
            return(0, 0x20)
        }
    }
}
