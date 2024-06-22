// GF SECTION IN CNE!? OoO
var playerSide:Bool = false;
var opponentSide:Bool = false;
var camTarget:Bool = false;

var sings = ["LEFT", "DOWN", "UP", "RIGHT"];

var sides:String = "";

function onEvent(e){
    if (e.event.name == "GF Section" || e.event.name == "GF_Section"){
        if (e.event.params[1] == false){
            trace("off (CamTarget)");
            camTarget = false;
        } else if (e.event.params[1] == true){
            trace("on (CamTarget)");
            camTarget = true;
        }
        if (e.event.params[0] == true && e.event.params[2] == 'player'){
            trace("playerSide");
            sides = "player";
            playerSide = true;
            opponentSide = false;
        } else if (e.event.params[0] == true && e.event.params[2] == 'opponent'){
            trace("opponentSide");
            sides = "opponent";
            playerSide = false;
            opponentSide = true;
        } else if (e.event.params[0] == false){
            trace("off/none");
            playerSide = false;
            opponentSide = false;
            sides = "none";
        }
    }
}

function onCameraMove(e){// fixing the cam target to prevent the broken stuff and shits
    if (playerSide && !opponentSide && sides == "player" || !playerSide && opponentSide && sides == "opponent" && camTarget){
        curCameraTarget = 2;
    } else if (!playerSide && !opponentSide && sides == "player" && sides != "opponent" || sides == "none" && curCameraTarget != 0 && !camTarget || camTarget) {
        curCameraTarget = 1;
    } else if (!playerSide && !opponentSide && sides == "opponent" && sides != "player" || sides == "none" && curCameraTarget != 1  && !camTarget || camTarget) {
        curCameraTarget = 0;
    }
}

function onPlayerHit(e){
    
    if (playerSide && !opponentSide && sides == "player" && sides != "opponent"){
        if(e.noteType == "" || e.noteType == null){
            e.characters = strumLines.members[2].characters;
            
        }
    }
}

function onDadHit(e){
    
    if (!playerSide && opponentSide && sides != "player" && sides == "opponent"){
        if(e.noteType == "" || e.noteType == null){
            e.characters = strumLines.members[2].characters;
        }
    }
}