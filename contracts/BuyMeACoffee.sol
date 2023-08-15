// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.4;

// Switch this to your own contract address once deployed, for bookkeeping!
// Example Contract Address on Goerli: 0xDBa03676a2fBb6711CB652beF5B7416A53c1421D

contract BuyMeACoffee {
    // Event to emit when a Memo is created.
    event newMemo(
        address indexed from,
        uint256 timestamp,
        string name,
        string message
    );

    // Memo struct. what a memo is
    struct Memo{
        address from;
        uint256 timestamp;
        string name;
        string message;
    }

    // list of all memos received from friends
    Memo[] memos;

    //address of contract deployer.
    address payable owner;   

    //Deploy logic
    constructor(){
        owner = payable(msg.sender);


    }

    // to buy a coddee to contract owner
    // @param _name name of the coffee buyer
    // @param _message a nice message from the coffee buyer
    function buyCoffee(string memory _name, string memory _message) public payable{
        require(msg.value>0, "Can't buy coffe with 0 eth");

        // add to memo to storage
        memos.push(Memo(
            msg.sender,
            block.timestamp,
            _name,
            _message
        ));

        // emit a log event when new memo created
        emit newMemo(
            msg.sender,
            block.timestamp,
            _name,
            _message);
    }

    // send entire balance stored in this contract to owner
    function withdrawTips() public{
        require(owner.send(address(this.balance));

    }

    // retrieve all the memos stored in blockchain
    function getMemos() public {

    }

}
