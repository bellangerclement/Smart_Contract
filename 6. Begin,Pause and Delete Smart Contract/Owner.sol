// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;


contract Owner {

address owner;
bool paused;
uint nombre;
constructor(){
    owner = msg.sender;

}
// mettre en pause un smart contract
function setpaused(bool _paused)public{
    require(msg.sender == owner," Not the owner");
    paused= _paused;
}
function setNombre(uint _nombre)public{
    require(!paused, "Contract is paused");
    require(msg.sender == owner," Not the owner");
    nombre = _nombre;
}
function getNombre()public view returns(uint){
    require(!paused, "Contract is paused");
    return nombre;
}
function destroy(address payable _to) public {
    require (msg.sender == owner," Not the owner");
    selfdestruct(_to);
}
}