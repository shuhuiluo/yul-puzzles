// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract BatchEvents {
    // EMIT ME!!!
    event MyEvent(address indexed emitter, bytes32 indexed id, uint256 num);

    function main(address[] memory emitters, bytes32[] memory ids, uint256[] memory nums) external {
        bytes32 eventHash = MyEvent.selector;
        assembly {
            // your code here
            // emit the `MyEvent(address,bytes32,uint256)` event
            // Assuming all arrays (emitters, ids, and nums) are of equal length.
            // iterate over the set of parameters and emit events based on the array length.
            let len := mload(emitters)
            let offset := 0x20
            for { let i := 0 } 1 { i := add(i, 1) } {
                if iszero(lt(i, len)) { break }
                mstore(0, mload(add(nums, offset)))
                log3(0, 0x20, eventHash, mload(add(emitters, offset)), mload(add(ids, offset)))
                offset := add(offset, 0x20)
            }
        }
    }
}
