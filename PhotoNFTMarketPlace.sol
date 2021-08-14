pragma solidity ^0.5.16;
pragma experimental ABIEncoderV2;

//import { ERC20 } from './openzeppelin-solidity/contracts/token/ERC20/ERC20.sol';
import { SafeMath } from "./openzeppelin-solidity/contracts/math/SafeMath.sol";
import { PhotoNFT } from "./PhotoNFT.sol";
import { PhotoNFTTradable } from "./PhotoNFTTradable.sol";
import { PhotoNFTMarketplaceEvents } from "./photo-nft-marketplace/commons/PhotoNFTMarketplaceEvents.sol";
import { PhotoNFTData } from "./PhotoNFTData.sol";


contract PhotoNFTMarketplace is PhotoNFTTradable, PhotoNFTMarketplaceEvents {
    using SafeMath for uint256;

    address public PHOTO_NFT_MARKETPLACE;

    PhotoNFTData public photoNFTData;

    address public creatorAddr;

    constructor(PhotoNFTData _photoNFTData) public PhotoNFTTradable(_photoNFTData) {
        creatorAddr = msg.sender;
        photoNFTData = _photoNFTData;
        address payable PHOTO_NFT_MARKETPLACE = address(uint160(address(this)));
    }


    /** 
     * @notice - Buy function is that buy NFT token and ownership transfer. (Reference from IERC721.sol)
     * @notice - msg.sender buy NFT with ETH (msg.value)
     * @notice - PhotoID is always 1. Because each photoNFT is unique.
     */
    function buyPhotoNFT(PhotoNFT _photoNFT) public payable returns (bool) {
        PhotoNFT photoNFT = _photoNFT;

        PhotoNFTData.Photo memory photo = photoNFTData.getPhotoByNFTAddress(photoNFT);
        address _seller = photo.ownerAddress;/// Owner
        address _artist = photo.artistAddress;/// Creator
        address payable seller = address(uint160(_seller));  /// Convert owner address with payable
        address payable artist = address(uint160(_artist));  /// Convert artist address with payable
        address payable creator = address(uint160(creatorAddr));  /// Convert artist address with payable
        uint buyAmount = photo.photoPrice * 10250 / 10000;
        uint photoPrice = photo.photoPrice;
        require (msg.value == buyAmount, "msg.value should be equal to the photoPrice");
 
        /// Bought-amount is transferred into a seller wallet
        

        seller.transfer(photoPrice * 8750 / 10000);

        artist.transfer(photoPrice * 1000 / 10000 );

        creator.transfer(photoPrice * 500 / 10000 );

        /// Approve a buyer address as a receiver before NFT's transferFrom method is executed
        address buyer = msg.sender;
        uint photoId = 1;  /// [Note]: PhotoID is always 1. Because each photoNFT is unique.
        photoNFT.approve(buyer, photoId);

        address ownerBeforeOwnershipTransferred = photoNFT.ownerOf(photoId);

        /// Transfer Ownership of the PhotoNFT from a seller to a buyer
        transferOwnershipOfPhotoNFT(photoNFT, photoId, buyer);    
        photoNFTData.updateOwnerOfPhotoNFT(photoNFT, buyer);
        photoNFTData.updateStatus(photoNFT, "Cancelled");

        /// Event for checking result of transferring ownership of a photoNFT
        address ownerAfterOwnershipTransferred = photoNFT.ownerOf(photoId);
        emit PhotoNFTOwnershipChanged(photoNFT, photoId, ownerBeforeOwnershipTransferred, ownerAfterOwnershipTransferred);

        /// Mint a photo with a new photoId
        //string memory tokenURI = photoNFTFactory.getTokenURI(photoData.ipfsHashOfPhoto);  /// [Note]: IPFS hash + URL
        //photoNFT.mint(msg.sender, tokenURI);
    }


    ///-----------------------------------------------------
    /// Methods below are pending methods
    ///-----------------------------------------------------

    /** 
     * @dev reputation function is that gives reputation to a user who has ownership of being posted photo.
     * @dev Each user has reputation data in struct
     */
    function reputation(address from, address to, uint256 photoId) public returns (uint256, uint256) {

        // Photo storage photo = photos[photoId];
        // photo.reputation = photo.reputation.add(1);

        // emit AddReputation(photoId, photo.reputation);

        // return (photoId, photo.reputation);
        return (0, 0);
    }
    

    function getReputationCount(uint256 photoId) public view returns (uint256) {
        uint256 curretReputationCount;

        // Photo memory photo = photos[photoId];
        // curretReputationCount = photo.reputation;

        return curretReputationCount;
    }    

}
