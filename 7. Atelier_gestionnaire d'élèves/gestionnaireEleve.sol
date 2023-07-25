// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

contract GestionnaireEleve {

    address owner;
     struct Grade {
        string subject;
        uint grade;
     }
    struct Student {
        string firstName;
        string lastName;
        uint numberOfGrades;
        mapping(uint => Grade) grades;
    }
mapping(address => Student) students;

constructor() {
    owner = msg.sender;
}
function addStudent(address _studentAddress, string memory _firstName, string memory _lastName) public{
    require (msg.sender == owner," Not the owner");
    bytes memory firstnameOfAdress = bytes (students[_studentAddress].firstName);
    require(firstnameOfAdress.length ==0,"Existe deja");
    students[_studentAddress].firstName = _firstName;
    students[_studentAddress].lastName = _lastName;

}
function addGrade (address _studentAddress, uint _grade, string memory _subject)public{
require (msg.sender == owner," Not the owner");
    bytes memory firstnameOfAddress = bytes (students[_studentAddress].firstName);
require(firstnameOfAddress.length >0,"Il faut creer l eleve");
students[_studentAddress].grades[students[_studentAddress].numberOfGrades].grade = _grade;
students[_studentAddress].grades[students[_studentAddress].numberOfGrades].subject = _subject;
students[_studentAddress].numberOfGrades++;

}
function getGrades(address _studentAddress) public view returns (uint [] memory) {
    require (msg.sender == owner," Not the owner");
    uint nomberGradesThisStudent = students[_studentAddress].numberOfGrades;
    uint[]memory grades = new uint [](nomberGradesThisStudent);
    for (uint i = 0; i < nomberGradesThisStudent; i++){
        grades[i] = students[_studentAddress].grades[i].grade;
    }
    return grades;
}




}