// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import {Faucet} from "../src/Faucet.sol";
import {MockERC20} from "../src/Token.sol";
import {IERC20} from "openzeppelin-contracts/token/ERC20/IERC20.sol";

contract D_Faucet is Script {
    function run() public {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);

        MockERC20 token = new MockERC20();
        new Faucet(IERC20(token));

        vm.stopBroadcast();
    }
}
