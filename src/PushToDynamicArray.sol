// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract PushToDynamicArray {
    uint256[] pushToMe = [23, 4, 19, 3, 44, 88];

    function main(uint256 newValue) external {
        assembly {
            // your code here
            // push the newValue to the dynamic array `pushToMe`
            // Hint: https://www.rareskills.io/post/solidity-dynamic
            let len := sload(pushToMe.slot)
            sstore(pushToMe.slot, add(len, 1))
            mstore(0, pushToMe.slot)
            let arr := keccak256(0, 0x20)
            sstore(add(arr, len), newValue)
        }
    }

    function getter() external view returns (uint256[] memory) {
        return pushToMe;
    }
}
