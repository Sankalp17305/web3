pragma solidity ^0.8.0;

contract InteractionLogger {
    struct Interaction {
        address user;
        uint256 timestamp;
    }

    Interaction[] public interactions;

    event InteractionLogged(address indexed user, uint256 timestamp);

    function logInteraction() public {
        interactions.push(Interaction(msg.sender, block.timestamp));
        emit InteractionLogged(msg.sender, block.timestamp);
    }

    function getInteraction(uint256 index) public view returns (address, uint256) {
        require(index < interactions.length, "Index out of bounds");
        Interaction memory interaction = interactions[index];
        return (interaction.user, interaction.timestamp);
    }

    function getInteractionCount() public view returns (uint256) {
        return interactions.length;
    }
}
