function postCreate(){
    boyfriend.cameraOffset.x = -100;
    dadZoom = .6;
    bfZoom = .7;
}
function blow(){
    dad.danceOnBeat = false;
    new FlxTimer().start(1, function(tmr:FlxTimer)
    {
    camHUD.alpha = 0.001;
    camGame.alpha = 0.001;
    });
}