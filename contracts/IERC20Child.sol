//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "./openzeppline/token/ERC20/IERC20.sol";

interface IERC20Child is IERC20 {
    /**
     * @dev Mint tokens
     *
     * @param recipient an address for whom minting is being done
     * @param amount total amount to mint
     */
    function mint(address recipient, uint256 amount) external;

    /**
     * @dev Should burn recipient's tokens.
     *
     * @param amount total amount to burn
     */
    function burn(uint256 amount) external;

    /**
     * Burn token
     * @param account an address for whom burning is being done
     * @param amount total amount to burn
     */
    function burnFrom(address account, uint256 amount) external;
}
