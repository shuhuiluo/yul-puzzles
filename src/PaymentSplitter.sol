// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract PaymentSplitter {
    function main(address[] calldata recipients) external payable {
        assembly {
            // your code here
            // send the entire contract balance to the recipients
            // each recipient gets balance / recipients.length
            let value := div(selfbalance(), recipients.length)
            for { let i := 0 } lt(i, recipients.length) { i := add(i, 1) } {
                let recipient := calldataload(add(recipients.offset, shl(5, i)))
                pop(call(gas(), recipient, value, 0, 0, 0, 0))
            }
        }
    }
}
