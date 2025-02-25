// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface ICurvePool {
    // Standard swap between pool tokens (e.g., DAI -> USDC in 3pool)
    function exchange(int128 i, int128 j, uint256 dx, uint256 min_dy) external returns (uint256);

    // Swap between underlying tokens (e.g., DAI -> USDC in a lending pool)
    function exchange_underlying(uint256 i, uint256 j, uint256 dx, uint256 min_dy) external returns (uint256);

    // Estimate output for standard swap
    function get_dy(int128 i, int128 j, uint256 dx) external view returns (uint256);

    // Estimate output for underlying swap
    function get_dy_underlying(uint256 i, uint256 j, uint256 dx) external view returns (uint256);
}
