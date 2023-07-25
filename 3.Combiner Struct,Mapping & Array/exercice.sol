// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;
// exercice qui permet de gérer notes d'élèves
contract Exercice{

struct eleve{
        string nom;
        string prenom;
        uint[] notes;
}
mapping(address => eleve)Eleves;
// rajouter  une valeur dans le tableau notes
function addNotes( address _eleve, uint _note)public {
    Eleves[_eleve].notes.push(_note);
}
//récupérer les valeur du tableau notes de l'élève
function getNote(address _eleve)public view returns(uint[] memory){
    return Eleves[_eleve].notes;
}
// Donner un nom à un élève lié à l'account
function setNom(address _eleve, string memory _nom)public{
    Eleves[_eleve].nom = _nom;
}

// récupérer le nom via l'account
function getNom(address _eleve)public view returns(string memory){
    return Eleves[_eleve].nom;
}


}