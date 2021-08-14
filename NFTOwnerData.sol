// pragma solidity ^0.5.16;
// pragma experimental ABIEncoderV2;

// import { NFTOwnerDataStorages } from "./NFTOwnerData/NFTOwnerDataStorages.sol";

// /**
//  * @notice - This is the storage contract for photoNFTs
//  */
// contract NFTOwnerData is NFTOwnerDataStorages {

//     constructor() public {}

//     function update_Banner(string memory ipfsHashOfBanner){
//         uint ownerIndex = getOwnerIndex(msg.sender);
//             nftOwners[ownerIndex].banner = ipfsHashOfBanner;
//     }

//     function update_Avartar(string memory ipfsHashOfAvartar){
//         uint ownerIndex = getOwnerIndex(msg.sender);
//         nftOwners[ownerIndex].avartar = ipfsHashOfAvartar;
//         // if(ownerIndex == -1){
//         //     NFTOwner newNFTOwner = new NFTOwner(msg.sender, ipfsHashOfAvartar, "", "", "", "", "", "", "", "");
//         //     nftOwners.push(newNFTOwner);}
//         // else{
//         //     nftOwners[ownerIndex].avartar = ipfsHashOfAvartar;
//         // }
//     }

//     function updateUserSetting(string memory userName, string memory bio, string memory email, string memory telegram, string twitter, string linkedin )
//     {
//         uint ownerIndex = getOwnerIndex(msg.sender);
       
//             nftOwners[ownerIndex].userName = userName;
//             nftOwners[ownerIndex].bio = bio;
//             nftOwners[ownerIndex].email = email;
//             nftOwners[ownerIndex].telegram = telegram;
//             nftOwners[ownerIndex].twitter = twitter;
//             nftOwners[ownerIndex].linkedin = linkedin;
//     }

//      function getOwnerData() public returns (NFTOwner)
//     {
//         uint ownerIndex = getOwnerIndex(msg.sender);
//         if(ownerIndex == -1) { return new NFTOwner(msg.sender, "", "", "", "", "", "", "", "", "");}
//         else return nftOwners(ownerIndex);
//     }

//     // function likeOrDislikePhoto(PhotoNFT photoNFT)
//     // {
//     //     uint ownerIndex = getOwnerIndex(msg.sender);
//     //     if(nftOwners[ownerIndex].favoriteAddresses)
//     // }

    
//     function getOwnerIndex(address newAddress) public view returns (uint ownerIndex) {

//         /// Identify member's index
//         uint ownerIndex = -1;
//         for (uint i=0; i < nftOwners.length; i++) {
//             if (nftOwners[i].walletAddress == newAddress) {
//                 ownerIndex = i;
//             }
//         }
//         return ownerIndex;   
//     }

   
// }
