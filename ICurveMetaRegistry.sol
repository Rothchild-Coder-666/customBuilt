pragma solidity ^0.8.20;

interface ICurveMetaRegistry {
    function get_pool_params(address _pool, uint256 _handler_id) external view returns (uint256[] memory);
    function get_base_pool(address _pool, uint256 _handler_id) external view returns (address);
    function is_meta(address _pool, uint256 _handler_id) external view returns (bool);
    function get_coin_addresses(address _pool, uint256 _handler_id) external view returns (address[] memory);
    function get_underlying_coins(address _pool, uint256 _handler_id) external view returns (address[] memory);
    function get_decimals(address _pool, uint256 _handler_id) external view returns (uint256[] memory);
    function get_underlying_decimals(address _pool, uint256 _handler_id) external view returns (uint256[] memory);
    function get_lp_token(address _pool, uint256 _handler_id) external view returns (address);
    function get_A(address _pool, uint256 _handler_id) external view returns (uint256);
    function get_fee(address _pool, uint256 _handler_id) external view returns (uint256);
    function get_virtual_price(address _pool, uint256 _handler_id) external view returns (uint256);
    function get_dy(address _pool, uint256 _handler_id, int128 i, int128 j, uint256 dx) external view returns (uint256);
    function get_dy_underlying(address _pool, uint256 _handler_id, int128 i, int128 j, uint256 dx) external view returns (uint256);
    function get_n_coins(address _pool, uint256 _handler_id) external view returns (uint256);
    function get_n_underlying_coins(address _pool, uint256 _handler_id) external view returns (uint256);
    function get_pool_from_lp_token(address _lp_token, uint256 _handler_id) external view returns (address);
    function find_pool_for_coins(address _from, address _to) external view returns (address);
    function get_coin_indices(address _pool, address _from, address _to) external view returns (int128, int128, bool);
}

