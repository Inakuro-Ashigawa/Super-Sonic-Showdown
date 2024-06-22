import flixel.addons.effects.FlxTrail;
var chaos:FlxTrail;

var __timer:Float = 0;
var float:Bool = false;

function charge(){
    cannon2.animation.play('fire');
    cannon2.alpha = 1;
}
function sonicshow(){

    gf.playAnim("skid");
    gf.alpha = 1;
    FlxTween.tween(gf, {x: gf.x - 1600}, 0.6, {ease: FlxEase.sineOut});
}
function create(){
    gf.setPosition(3400,1203.15);
    gf.scrollFactor.set(1,1);
    strumLines.members[1].characters[1].alpha = 0.0001;

    dadZoom = .55;
    bfZoom = .65;
    gfZoom = .85;
    gf.alpha = 0;
    boyfriend.cameraOffset.x = 30;

    exp = new FlxSprite(dad.x - 400,dad.y);
    exp.frames = Paths.getSparrowAtlas('misc/explosion');
    exp.animation.addByPrefix('blow', 'explosion idle', 24, false);
    exp.animation.finishCallback = function (n:String) {
        gf.alpha = 0.0001;
        exp.alpha = 0.0001;
    }
    exp.alpha = 0.001;
    exp.scrollFactor.set(1, 1);
    exp.scale.set(9,9);
    add(exp);
    
}
function postCreate(){
    cannon2 = new FlxSprite(459.5,877.5);
    cannon2.frames = Paths.getSparrowAtlas('stages/cannon2');
    cannon2.animation.addByPrefix('fire', 'fire', 24, false);
    cannon2.animation.finishCallback = function (n:String) {
        exp.animation.play('blow');
        gf.alpha = 0;
        exp.alpha = 1;
    }
    cannon2.scrollFactor.set(1, 1);
    cannon2.scale.set(1.12,1.12);
    cannon2.alpha = 0.001;

    add(cannon2);
}
//hahahahaha funni tras joke part 2!!!!!!!
function trans(){
    float = true;
    camGame.flash();
    camHUD.flash();
    dad.idleSuffix = "-mad";
}
function chaos(){
    strumLines.members[1].characters[1].alpha = 1;
    boyfriend.alpha = 0.0001;
    
    chaos = new FlxTrail(strumLines.members[1].characters[1], null, 4, 5, 0.5, 0.069); // nice
    insert(members.indexOf(boyfriend) - 1, chaos);
}
function update(elapsed:Float){

    __timer += elapsed;
    if (float){
        
        dad.y = dad.y + (Math.cos(__timer));
    }
}
