import flixel.addons.effects.FlxTrail;
import flixel.addons.effects.FlxTrailArea;
var chaos:FlxTrail;

function sonicshow(){
    gf.playAnim("skid");
    FlxTween.tween(gf, {x: gf.x - 1600}, 0.6, {ease: FlxEase.sineOut});
}
function postCreate(){
    strumLines.members[0].characters[1].alpha = 0.0001;
}
function create(){
    gf.setPosition(3400,1203.15);
    gf.scrollFactor.set(1,1);
    boyfriend.cameraOffset.x = -100;
    dadZoom = .55;
    bfZoom = .65;
}
function chaos(){
    strumLines.members[0].characters[1].alpha = 1;
    dad.alpha = 0.0001;
    
    powerTrail = new FlxTrail(strumLines.members[0].characters[1], null, 4, 5, 0.5, 0.069); // nice
    insert(members.indexOf(strumLines.members[0].characters[1]) - 1, powerTrail);
}
function yeah(){
    gf.playAnim("yeah",true);
    FlxTween.tween(camHUD, {alpha: 0.001}, 1, {ease: FlxEase.sineOut});
    FlxTween.tween(camGame, {alpha: 0.001}, 1, {StartDelay: .8, ease: FlxEase.sineOut});
}