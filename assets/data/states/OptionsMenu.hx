function postCreate(){
	var BG:FlxSprite = new FlxSprite().loadGraphic(Paths.image("menuDesat"));
    BG.scrollFactor.set(0,0);
    BG.screenCenter();
    BG.scale.set(.7,.7);
	insert(1,BG);
}