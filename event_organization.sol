// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract  EventContract{
    struct Event{
    address  organizer;
    string name;
    uint date; 
    uint price;
    uint ticketCout;
    uint ticketReamin;
    }

    mapping (uint=> Event) public events;
    mapping (address=> mapping(uint=>uint)) public tickets;
    uint public nextId;

    function createEvent(string memory _name, uint _date, uint _price, uint _ticketCount) public {
        require(_date > block.timestamp, "You can organize event for future");
        require(_ticketCount>0 ,"You can organize event only if you create more thaan 0 tickets");

        events[nextId] = Event(msg.sender, _name, _date, _price, _ticketCount, _ticketCount);
        nextId++;
    }

    function buyTicket(uint id, uint quantity) public  payable {
        require(events[id].date!= 0, "Event does not exist");
        require(events[id].date > block.timestamp, "Event has already occured");
        Event storage _event = events[id];
        require(msg.value ==(_event.price*quantity), "Ether is not enough");
        require(_event.ticketReamin >= quantity, "Not enough tickets");
        _event.ticketReamin-= quantity;
        tickets[msg.sender][id] = quantity;
    }

    function transferTicket(uint id, uint quantity, address to) public{
        require(events[id].date!= 0, "Event does not exist");
        require(events[id].date > block.timestamp, "Event has already occured");
        require(tickets[msg.sender][id]>= quantity, "You do not have enough tickets");
        tickets[msg.sender][id]-=quantity;
        tickets[to][id]+=quantity;
    }
    

}