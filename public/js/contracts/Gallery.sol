pragma solidity ^0.6.6;

contract Gallery {
    struct ArtWork {
        uint256 id;
        string name;
        uint256 likeCount;
        uint256 tipAmount;
    }

    address payable private owner;
    uint256 private balance;
    mapping(uint256 => ArtWork) public artworks;
    uint256 public artworkcount;

    event eventUpdate(uint256 indexed _artworkid);

    constructor() public {
        owner = msg.sender;
        addArtwork("Hippopotamus and Crocodile Hunt");
        addArtwork("The kiss");
        addArtwork("The Trapper");
        addArtwork("The Veiled Lady at Mia");
        addArtwork("Wave bowl");
        addArtwork("Fist Supper");
    }

    function addArtwork(string memory _name) private {
        artworkcount++;
        artworks[artworkcount] = ArtWork(artworkcount, _name, 0, 0);
    }

    function like(uint256 _artworkid) public {
        require(_artworkid > 0 && _artworkid <= artworkcount);
        artworks[_artworkid].likeCount++;
        emit eventUpdate(_artworkid);
    }

    function tip(uint256 _artworkid) public payable {
        require(_artworkid > 0 && _artworkid <= artworkcount);
        artworks[_artworkid].tipAmount += msg.value;
        balance += msg.value;
        emit eventUpdate(_artworkid);
    }

    function viewBalance() public view returns (uint256) {
        require(owner == msg.sender, "You are not the owner.");
        return balance;
    }

    function withdrawBalance() public {
        require(owner == msg.sender, "You are not the owner.");
        owner.transfer(address(this).balance);
    }
}
