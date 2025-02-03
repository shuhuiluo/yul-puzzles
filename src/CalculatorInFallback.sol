// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract CalculatorInFallback {
    uint256 public result;

    fallback() external {
        // your code here
        // compare the function selector in the calldata with the any of the selectors below, then
        // execute a logic based on the right function selector and store the result in `result` variable.
        // assumming operations won't overflow

        // add(uint256,uint256) -> 0x771602f7 (add two numbers and store result in storage)
        // sub(uint256,uint256) -> 0xb67d77c5 (sub two numbers and store result in storage)
        // mul(uint256,uint256) -> 0xc8a4ac9c (mul two numbers and store result in storage)
        // div(uint256,uint256) -> 0xa391c15b (div two numbers and store result in storage)
        assembly {
            switch shr(224, calldataload(0))
            case 0x771602f7 {
                let a := calldataload(0x04)
                let b := calldataload(0x24)
                sstore(result.slot, add(a, b))
            }
            case 0xb67d77c5 {
                let a := calldataload(0x04)
                let b := calldataload(0x24)
                sstore(result.slot, sub(a, b))
            }
            case 0xc8a4ac9c {
                let a := calldataload(0x04)
                let b := calldataload(0x24)
                sstore(result.slot, mul(a, b))
            }
            case 0xa391c15b {
                let a := calldataload(0x04)
                let b := calldataload(0x24)
                sstore(result.slot, div(a, b))
            }
            default { revert(0, 0) }
        }
    }
}
