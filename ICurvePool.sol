// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {IERC20} from '@openzeppelin/contracts/token/ERC20/IERC20.sol';

interface ICurvePool {
  
    // solhint-disable-next-line defi-wonderland/wonder-var-name-mixedcase
    function A() external view returns (uint256 _A);
    
    function calc_token_amount(uint256[] memory _amounts, bool _deposit) external view returns (uint256 _amount);

    // Standard swap between pool tokens (e.g., DAI -> USDC in 3pool)
    function exchange(int128 i, int128 j, uint256 dx, uint256 min_dy) external returns (uint256);

    // Swap between underlying tokens (e.g., DAI -> USDC in a lending pool)
    function exchange_underlying(uint256 i, uint256 j, uint256 dx, uint256 min_dy) external returns (uint256);

    // Estimate output for standard swap
    function get_dy(int128 i, int128 j, uint256 dx) external view returns (uint256);

    // Estimate output for underlying swap
    function get_dy_underlying(uint256 i, uint256 j, uint256 dx) external view returns (uint256);

    function coins(uint256 i) external view returns (address);

    function underlying_coins(uint256 i) external view returns (address);
    
}

interface IStablePool is ICurvePool {
  function lp_token() external view returns (IERC20 _lpToken);
  function remove_liquidity(
    uint256 _amount,
    uint256[2] memory _minAmounts
  ) external returns (uint256[2] memory _amounts);
  function add_liquidity(
    uint256[2] memory _amounts,
    uint256 _minMintAmount
  ) external payable returns (uint256 _lpAmount);
}

interface IV2Pool is ICurvePool {
  function token() external view returns (IERC20 _lpToken);
  function claim_admin_fees() external;
  function add_liquidity(
    uint256[2] memory _amounts,
    uint256 _minMintAmount,
    bool _useEth
  ) external payable returns (uint256 _lpAmount);
  function remove_liquidity(uint256 _amount, uint256[2] memory _minAmounts, bool _useEth) external;
}
