// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**
 * @title GalacticRegistry
 * @dev Mission: Register your ship in the interstellar database.
 */
contract GalacticRegistry {

    // 1. DATA STORAGE
    mapping(address => string) public registry;
    mapping(address => bool) public hasRegistered;

    // 2. EVENTS
    event Registered(address indexed pilot, string name);

    /**
     * @notice Registers a pilot with a unique name.
     * @param _name The name of the pilot.
     */
    function register(string memory _name) public {
        
    }

    /**
     * @notice Helper function to get a pilot's name
     */
    function getPilotName(address _pilot) public view returns (string memory) {
        return registry[_pilot];
    }
}