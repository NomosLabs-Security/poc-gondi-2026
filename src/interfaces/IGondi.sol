// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title IGondi - Simplified interfaces for Gondi NFT Lending Protocol
/// @notice Educational reproduction of the Gondi access control vulnerability

interface IERC721 {
    function ownerOf(uint256 tokenId) external view returns (address);
    function transferFrom(address from, address to, uint256 tokenId) external;
    function balanceOf(address owner) external view returns (uint256);
}

/// @dev Represents an active NFT-backed loan
struct LoanInfo {
    uint256 loanId;
    address borrower;
    address lender;
    address nftCollection;
    uint256 nftTokenId;
    uint256 principal;
    uint256 repaymentAmount;
    uint256 expiration;
    bool isActive;
}
