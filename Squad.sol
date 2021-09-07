// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Squad is ERC721Enumerable, ReentrancyGuard, Ownable {

        string[] private member1 = [
        "Asari Ardat-Yakshi",
        "Asari",
        "Salarian",
        "Turian",
        "Geth",
        "Quarian",
        "Volus",
        "Krogan",
        "Prothean",
        "Batarian",
        "Elcor",
        "Hanar",
        "Human",
        "Drell",
        "Asari Justicar"
    ];
    
    string[] private member2 = [
        "Asari Ardat-Yakshi",
        "Asari",
        "Salarian",
        "Turian",
        "Geth",
        "Quarian",
        "Volus",
        "Krogan",
        "Prothean",
        "Batarian",
        "Elcor",
        "Hanar",
        "Human",
        "Drell",
        "Asari Justicar"
    ];
    
    string[] private member3 = [
        "Asari Ardat-Yakshi",
        "Asari",
        "Salarian",
        "Turian",
        "Geth",
        "Quarian",
        "Volus",
        "Krogan",
        "Prothean",
        "Batarian",
        "Elcor",
        "Hanar",
        "Human",
        "Drell",
        "Asari Justicar"
    ];
    
    string[] private member4 = [
        "Asari Ardat-Yakshi",
        "Asari",
        "Salarian",
        "Turian",
        "Geth",
        "Quarian",
        "Volus",
        "Krogan",
        "Prothean",
        "Batarian",
        "Elcor",
        "Hanar",
        "Human",
        "Drell",
        "Asari Justicar"
    ];
    
    string[] private member5 = [
        "Asari Ardat-Yakshi",
        "Asari",
        "Salarian",
        "Turian",
        "Geth",
        "Quarian",
        "Volus",
        "Krogan",
        "Prothean",
        "Batarian",
        "Elcor",
        "Hanar",
        "Human",
        "Drell",
        "Asari Justicar"
    ];
    
    string[] private clan = [
        "of the Citadel Council",
        "of the League of One",
        "of the Salarian Union",
        "of the Special Tasks Group",
        "of the Turian Military",
        "of the Alliance",
        "of the Turian Hierarchy",
        "of the Reapers",
        "of the Blue Suns",
        "of Clan Urdnot",
        "of Cerberus",
        "of the Migrant Fleet"
    ];
    
    string[] private class = [
        "Hunter",
        "Soldier",
        "Warrior",
        "Noble",
        "Spy",
        "Merchant",
        "Biotic",
        "Officer",
        "Adept",
        "Agent",
        "Engineer",
        "Battlemaster",
        "Machinist",
        "Scientist",
        "Shock Trooper",
        "Commando",
        "Operative",
        "Medic",
        "Bastion",
        "Infiltrator",
        "Assassin",
        "Thief",
        "Bounty hunter",
        "Sentinel",
        "Vanguard"
    ];
    
    
    function random(string memory input) internal pure returns (uint256) {
        return uint256(keccak256(abi.encodePacked(input)));
    }
    
    function getMember1(uint256 tokenId) public view returns (string memory) {
        return pluck(tokenId, "MEMBER1", member1);
    }
    
    function getMember2(uint256 tokenId) public view returns (string memory) {
        return pluck(tokenId, "MEMBER2", member2);
    }
    
    function getMember3(uint256 tokenId) public view returns (string memory) {
        return pluck(tokenId, "MEMBER3", member3);
    }
    
    function getMember4(uint256 tokenId) public view returns (string memory) {
        return pluck(tokenId, "MEMBER4", member4);
    }

    function getMember5(uint256 tokenId) public view returns (string memory) {
        return pluck(tokenId, "MEMBER5", member5);
    }
    
    
    function pluck(uint256 tokenId, string memory keyPrefix, string[] memory sourceArray) internal view returns (string memory) {
        uint256 rand = random(string(abi.encodePacked(keyPrefix, toString(tokenId))));
        string memory output = sourceArray[rand % sourceArray.length];
        uint256 greatness = rand % 21;
        if (greatness > 4) {
            output = string(abi.encodePacked(class[rand % class.length], " ", output));
        }
        if (greatness > 13) {
            string memory clan = clan[rand % clan.length];
            output = string(abi.encodePacked(output, " ", clan[rand % clan.length]));
        }
        if (greatness >= 19) {
            output = string(abi.encodePacked(output, ". Genetically engineered."));
        }
        return output;
    }

    function tokenURI(uint256 tokenId) override public view returns (string memory) {
        string[11] memory parts;
        parts[0] = '<svg xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMinYMin meet" viewBox="0 0 350 350"><style>.base { fill: white; font-family: sans-serif; font-size: 14px; }</style><rect width="100%" height="100%" fill="black" /><text x="10" y="20" class="base">';

        parts[1] = getMember1(tokenId);

        parts[2] = '</text><text x="10" y="40" class="base">';

        parts[3] = getMember2(tokenId);

        parts[4] = '</text><text x="10" y="60" class="base">';

        parts[5] = getMember3(tokenId);

        parts[6] = '</text><text x="10" y="80" class="base">';

        parts[7] = getMember4(tokenId);

        parts[8] = '</text><text x="10" y="100" class="base">';

        parts[9] = getMember5(tokenId);

        parts[10] = '</text></svg>';

        string memory output = string(abi.encodePacked(parts[0], parts[1], parts[2], parts[3], parts[4], parts[5], parts[6], parts[7], parts[8]));
        output = string(abi.encodePacked(output, parts[9], parts[10]));
        
        string memory json = Base64.encode(bytes(string(abi.encodePacked('{"name": "Squad #', toString(tokenId), '", "description": "Squad is your randomized party in the Mass Effect universe and stored on chain. Stats, images, and other functionality are intentionally omitted for others to interpret. Feel free to use Squad in any way you want.", "image": "data:image/svg+xml;base64,', Base64.encode(bytes(output)), '"}'))));
        output = string(abi.encodePacked('data:application/json;base64,', json));

        return output;
    }

    function claim(uint256 tokenId) public nonReentrant {
        require(tokenId > 0 && tokenId < 7778, "Token ID invalid");
        _safeMint(_msgSender(), tokenId);
    }
    
    function ownerClaim(uint256 tokenId) public nonReentrant onlyOwner {
        require(tokenId > 7777 && tokenId < 8001, "Token ID invalid");
        _safeMint(owner(), tokenId);
    }
    
    function toString(uint256 value) internal pure returns (string memory) {
    // Inspired by OraclizeAPI's implementation - MIT license
    // https://github.com/oraclize/ethereum-api/blob/b42146b063c7d6ee1358846c198246239e9360e8/oraclizeAPI_0.4.25.sol

        if (value == 0) {
            return "0";
        }
        uint256 temp = value;
        uint256 digits;
        while (temp != 0) {
            digits++;
            temp /= 10;
        }
        bytes memory buffer = new bytes(digits);
        while (value != 0) {
            digits -= 1;
            buffer[digits] = bytes1(uint8(48 + uint256(value % 10)));
            value /= 10;
        }
        return string(buffer);
    }
    
    constructor() ERC721("Squad", "SQUAD") Ownable() {}
}

/// [MIT License]
/// @title Base64
/// @notice Provides a function for encoding some bytes in base64
/// @author Brecht Devos <brecht@loopring.org>
library Base64 {
    bytes internal constant TABLE = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";

    /// @notice Encodes some bytes to the base64 representation
    function encode(bytes memory data) internal pure returns (string memory) {
        uint256 len = data.length;
        if (len == 0) return "";

        // multiply by 4/3 rounded up
        uint256 encodedLen = 4 * ((len + 2) / 3);

        // Add some extra buffer at the end
        bytes memory result = new bytes(encodedLen + 32);

        bytes memory table = TABLE;

        assembly {
            let tablePtr := add(table, 1)
            let resultPtr := add(result, 32)

            for {
                let i := 0
            } lt(i, len) {

            } {
                i := add(i, 3)
                let input := and(mload(add(data, i)), 0xffffff)

                let out := mload(add(tablePtr, and(shr(18, input), 0x3F)))
                out := shl(8, out)
                out := add(out, and(mload(add(tablePtr, and(shr(12, input), 0x3F))), 0xFF))
                out := shl(8, out)
                out := add(out, and(mload(add(tablePtr, and(shr(6, input), 0x3F))), 0xFF))
                out := shl(8, out)
                out := add(out, and(mload(add(tablePtr, and(input, 0x3F))), 0xFF))
                out := shl(224, out)

                mstore(resultPtr, out)

                resultPtr := add(resultPtr, 4)
            }

            switch mod(len, 3)
            case 1 {
                mstore(sub(resultPtr, 2), shl(240, 0x3d3d))
            }
            case 2 {
                mstore(sub(resultPtr, 1), shl(248, 0x3d))
            }

            mstore(result, encodedLen)
        }

        return string(result);
    }
}