//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "./openzeppline/token/ERC20/ERC20.sol";
import "./openzeppline/token/ERC20/extensions/ERC20Burnable.sol";

contract Token is ERC20, ERC20Burnable {
    address private _bridge;

    constructor(uint256 initialSupply) ERC20("SomeToken", "SOME") {
        _mint(msg.sender, initialSupply);
    }

    modifier onlyBridge() {
        require(msg.sender == _bridge, "Only the bridge can burn tokens.");
        _;
    }

    function mint(address recipient, uint256 amount) external {
        _mint(recipient, amount);
    }

    function burn(uint256 amount) public virtual override(ERC20Burnable) {
        super.burn(amount);
    }

    function burnFrom(address account, uint256 amount)
        public
        virtual
        override(ERC20Burnable)
    {
        super.burnFrom(account, amount);
    }
}
