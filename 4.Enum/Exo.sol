// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;
// exercice qui permet de créer un smart contract qui va gérer des produits
contract Exo{

    enum etape {commande, expedie,livre} // pas de point virgule à la fin du enum
    // Attention  on récupère les valeur de enum en nombre commande = 1; expedie = 2;livre = 3

    struct produit {
        uint _SKU;
        Exo.etape _etape;
    }
    mapping(address => produit) CommandesClient;
    // création del afonction commander
    function commander(address _client,uint _SKU)public{
        produit memory p = produit(_SKU, etape.commande);
        CommandesClient[_client] = p;
    }
    function expedier (address _client)public {
        CommandesClient[_client]._etape = etape.expedie;
    }
    function getSKU(address _client)public view returns(uint) {
        return CommandesClient[_client]._SKU;
    }
    function getEtape(address _client)public view returns (etape) {
        return CommandesClient[_client]._etape;
    }

}