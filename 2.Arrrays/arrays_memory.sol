// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;
// deux types de tableau en solidity:
// le  type storage : stocké dans la blockchain(à l'extérieur des fonctions)
//le type memory non stocké dans la Blockchain( à l'intérieur des fonctions)
contract Arrays{

    uint[] nombre;
// Rajouter uen valeur dans un tableau
    function addValue(uint _valeur)public{
        nombre.push(_valeur);
    }
// Changer la valeur dans un tableau
    function updateValue(uint _valeur, uint _index)public{
    nombre[_index]= _valeur;
    }
// supprimer la valeur dans un tableau
    function removeValue(uint _index)public{
    delete nombre[_index];
    }
// Retourner la valeur dans un tableau
     function getValue(uint _index)public view returns (uint){
return nombre[_index];
     }

// tableau memory avec le multiple de 2 des nombres du tableau
    function getNombreX2()public view returns(uint[] memory){
        uint longueur = nombre.length;
        uint[] memory nombreX2 = new uint[](longueur);
        for (uint i = 0; i<longueur; i++){
            nombreX2[i] = nombre[i]*2;
        }
        return nombreX2;
    }
    //function somme(uint [] memory monTableau) public{}  // pour visibilité public
    //function somme(uint [] calldata monTableau) external{} // pour visibilité extérieur
}