var __timer:Float = 0;
var float:Bool = false;

function float(){
    float = true;
    camGame.flash();
    camHUD.alpha = 1;
    defaultcamZoom = .7;
}
//hahahahaha funni tras joke!!!!!!!
function trans(){
    boyfriend.alpha = 0.0001;
    strumLines.members[1].characters[1].alpha = 1;
    camGame.flash();
    camHUD.flash();
}
function postCreate(){
    defaultcamZoom = 1;
    camHUD.alpha = 0.001;
    strumLines.members[1].characters[1].alpha = 0.0001;
    boyfriend.cameraOffset.x = -100;
    dadZoom = 0.65;
    bfZoom = 0.8;
}
function update(elapsed:Float){

    __timer += elapsed;
    if (float){
        dad.y = (200*Math.cos(__timer));
    }
}
