// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract EventWithComplexData {
    // EMIT ME!!!
    event MyEvent(address indexed emitter, address[] players, uint256[] scores);

    function main(address emitter, address[] memory players, uint256[] memory scores) external {
        bytes32 eventHash = MyEvent.selector;
        assembly {
            // your code here
            // emit the `MyEvent(address,address[],uint256[])` event
            // Hint: Use `log2` to emit the event with the hash as the topic0 and `emitter` as topic1, then the data
            let fmp := mload(0x40)
            mstore(fmp, 0x40)
            let playersLength := add(0x20, shl(5, mload(players)))
            let scoresOffset := add(0x40, playersLength)
            let scoresLength := add(0x20, shl(5, mload(scores)))
            mstore(add(fmp, 0x20), scoresOffset)
            mcopy(add(fmp, 0x40), players, playersLength)
            mcopy(add(fmp, scoresOffset), scores, scoresLength)
            log2(fmp, add(scoresOffset, scoresLength), eventHash, emitter)
        }
    }
}
