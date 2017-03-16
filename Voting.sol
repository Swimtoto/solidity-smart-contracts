pragma solidity ^0.4.0;


// Simple smart-contract for a referundum (YES/NO answer only)

// Add a deadline for voting


contract Voting {
    // Variable
    
    struct Voter {
        address ID;
        bool hasVoted;
        string choice;
    }
    
    struct Proposal {
        string name;
        uint voteReceived;
    }
    
    Voter[] public registered;  // List of people registred to vote
    Voter[] public listOfVoter; // List of people who voted - Useful for statistics
    Proposal[2] public count;
    
    address public chairperson;
    
    uint public deadline;
    
    // Constructor
    function Voting() {
        chairperson = msg.sender;
        
        // The "poll" is launched Sunday morning at 9.00 am and will be closed at 9.00 pm
        uint deadline = now + 12 hours;
        count[0] = Proposal("Yes", 0);
        count[1] = Proposal("No", 0);
    }
    
    function vote(_voter) {
        
        // Check if the voter is authorized
        bool authorized = false;
        for(int i = 0; i < registered.length; i++) {
            if(_voter.ID == registered[i].ID)
                authorized = true;
        }
        
        // The voter choose his vote: Yes or No by clicking a button on the webpage (buttonNo / buttonYes)
        
        
        
        if((authorized) && (!_voter.hasVoted)) {
            if(buttonClicked == buttonNo) {
                count[1].voteReceived++;
                _voter.hasVoted = true;
            }
            
            else if (buttonClicked == buttonYes) {
                count[0].voteReceived++;
                _voter.hasVoted = true;
            }
            // Add the voter to the list of people who voted
            listOfVoter.push(_voter);
        }
        
        
        
    }
    
    // Find the winning proposal at the end of countdown
    function winningProposal() returns (string winningProposal) {
        winningProposal = "";
        if(count[0].voteReceived > count[1].voteReceive)
            winningProposal = "Yes";
        else if(count[0].voteReceived < count[1].voteReceive)
            winningProposal = "No";
        else
            winningProposal = "Draw";
    }
    
    
    
    
    
    // Event
    //event deadlineReached
    
    // Modifier
    
    
    // Kill
}



// @notice Description complète de la fonction
// @param nomParamètre Description
// function nomFonction(param) modifiers() returns() {
// }







