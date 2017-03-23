pragma solidity ^0.4.0;

contract Fidelity {
    
    struct Account {
        address owner;
        uint numberOfFidelityPoints;
        address[] nephews;
        address[] sponsors;
    }
    
    mapping(address=>Account) accounts;
    
    function CreateAccount(){
        Account account;
        account.owner=msg.sender;
        account.numberOfFidelityPoints=0;
        accounts[msg.sender]=account;
    }
    
    function Sponsor(address nephew) returns(bool){
        if (accounts[nephew].sponsors.length<2 && accounts[nephew].sponsors[0]!=msg.sender){
            accounts[nephew].sponsors[accounts[nephew].sponsors.length]=msg.sender;
            accounts[nephew].numberOfFidelityPoints+=10;
            accounts[msg.sender].nephews[accounts[msg.sender].nephews.length]=nephew;
            accounts[msg.sender].numberOfFidelityPoints+=10;
            return true;
        }
        return false;
    }
    
    function Fidelity(){}
    function kill(){ selfdestruct(owner);}
}