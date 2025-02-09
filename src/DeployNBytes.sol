// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

//contract NBytes {
//    constructor() {
//        assembly {
//            codecopy(0, init code size, 0x20)
//            return(0, mload(0))
//        }
//    }
//}

contract DeployNBytes {
    function main(uint256 size) external returns (address) {
        assembly {
            // your code here
            // create a contract that is size bytes long
            // hint: you will need to generalize the init code of DeployOneByte
            // hint: use mstore8 to target a single byte
            // hint: because we only care about the size, you can simply return that region
            //       of memory and not care about what is inside it
            mstore(0, hex"6020600d6000396000516000f3")
            mstore(0x0d, size)
            let addr := create(0, 0, 0x2d)
            mstore(0, addr)
            return(0, 0x20)
        }
    }
}
