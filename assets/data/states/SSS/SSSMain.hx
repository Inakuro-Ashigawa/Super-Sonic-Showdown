import funkin.backend.utils.DiscordUtil;
import funkin.backend.scripting.events.DiscordPresenceUpdateEvent;
import funkin.backend.scripting.events.MenuChangeEvent;
import funkin.backend.scripting.events.NameEvent;
import funkin.backend.scripting.EventManager;
import funkin.menus.credits.CreditsMain;
import funkin.options.OptionsMenu;
import funkin.editors.EditorPicker;
import funkin.menus.ModSwitchMenu;
import flixel.effects.FlxFlicker;
import funkin.backend.utils.CoolUtil;

var menuItems:FlxTypedGroup<FlxSprite>;
var menuItems = new FlxTypedGroup();
var optionShit:Array<String> = ['story', 'freeplay','bios','options'];
var spam:Bool = false;


function create(){

    var BG:FlxSprite = new FlxSprite().loadGraphic(Paths.image('menus/Main/menuBG'));
    BG.screenCenter();
    add(BG);
    
    add(menuItems);
    var tex = Paths.getSparrowAtlas('menus/Main/Menu_Assets');

    for (i in 0...optionShit.length)
		{
			var menuItem:FlxSprite = new FlxSprite(350, 40 + (i * 120));
            menuItem.frames = tex;
			menuItem.animation.addByPrefix('idle', optionShit[i] + " basic", 24);
			menuItem.animation.addByPrefix('selected', optionShit[i] + " white", 24);
			menuItem.animation.play('idle');
			menuItem.ID = i;
            menuItem.scale.set(.4,.4);
            //menuItem.screenCenter();
			menuItems.add(menuItem);
			menuItem.scrollFactor.set();
			menuItem.antialiasing = true;
            changeItem(4);
            menuItem.updateHitbox();
        }

}
function update(elapsed:Float)
	{   
        if (controls.BACK)
		{
            FlxG.switchState(new TitleState());
        }
        if (controls.UP_P)
        {
            changeItem(-1);
            FlxG.sound.play(Paths.sound('scrollMenu'));
        }
        if (controls.DOWN_P)
        {
            changeItem(1);
            FlxG.sound.play(Paths.sound('scrollMenu'));
        }
        if (FlxG.keys.justPressed.SEVEN) openSubState(new EditorPicker());

        if (controls.SWITCHMOD) {
            openSubState(new ModSwitchMenu());
            persistentUpdate = false;
            persistentDraw = true;
        }
        if (controls.ACCEPT && !spam)
			{
				spam = true;
                menuItems.forEach(function(spr:FlxSprite)
                {
                    if (curSelected != spr.ID)
                    {
					FlxG.sound.play(Paths.sound('confirmMenu'));
                    spr.kill();
                    }
                    else
                    {
                        //FlxTween.tween(spr, {x: 465, y: 280}, .4);
                        FlxTween.tween(FlxG.camera, {zoom: 1.4}, 2, {ease: FlxEase.expoOut});
                            FlxFlicker.flicker(spr, 1, 0.06, false, false, function(flick:FlxFlicker)
                            {
                                goToState();
                            });	
						}
					});
				}
			}
function goToState(){

    var daChoice:String = optionShit[curSelected];
    switch (daChoice)
    {
        case 'story':
            FlxG.switchState(new StoryMenuState());
            trace("Story Menu Selected");

        case 'freeplay':
            FlxG.switchState(new FreeplayState());
            trace("Freeplay Menu Selected");

        case 'options':
            FlxG.switchState(new OptionsMenu());
            trace("going to da options");

        case 'bios':
            FlxG.switchState(new ModState("SSS/SSSBios"));
            trace("going to da bios menu");

    }
}

var curSelected:Int = 0;
function changeItem(huh:Int = 0){

    curSelected = FlxMath.wrap(curSelected + huh, 0, optionShit.length-1);

    menuItems.forEach(function(spr:FlxSprite)
		{
			spr.animation.play('idle');

			if (spr.ID == curSelected )
			{
				spr.animation.play('selected');
			}

		});
    }