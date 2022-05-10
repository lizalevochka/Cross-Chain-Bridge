//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "./openzeppline/access/AccessControl.sol";
import "./openzeppline/security/Pausable.sol";
import "./IERC20Child.sol";

contract Bridge is AccessControl, Pausable {
    IERC20Child private _token;
    address private _gateway;

    constructor(address token, address gateway) {
        _token = IERC20Child(token);
        _gateway = gateway;
    }

    modifier onlyGateway() {
        require(
            msg.sender == _gateway,
            "This function is only available for gateway."
        );
        _;
    }

    function lockTokens(address account, uint256 amount) external onlyGateway {
        _token.burnFrom(account, amount);
    }

    function unlockTokens(address recipient, uint256 amount)
        external
        onlyGateway
    {
        _token.mint(recipient, amount);
    }
}
