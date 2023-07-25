// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

contract Exercice {

    uint nombre;

// Methode Ancienne
    // function setNombre (uint _nombre) public {
    //     if (_nombre ==10){
    //         revert('le nombre ne peut pas etre egal a 10');
    //         // Revert permet de stopper la fonction
    //     }
    //         nombre = _nombre;
    // }

function setNombre (uint _nombre) public {
        require (_nombre !=10, " Le nombre ne peut pas etre egal a 10");
         
            nombre = _nombre;
    }
    function getnombre()public view returns(uint) {
        return nombre;}
}