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
import flixel.addons.display.FlxBackdrop;
import funkin.backend.utils.CoolUtil;
var spam:Bool = false;
var initialized:Bool = false;

function create(){

    if (!initialized)
		{
			FlxG.sound.playMusic(Paths.music('freakyMenu'), 0);
			FlxG.sound.music.fadeIn(5, 0, 0.7);
            Conductor.changeBPM(120);
		}
    initialized = true;
    var logo:FlxSprite = new FlxSprite().loadGraphic(Paths.image('menus/Title/titleBG'));
    logo.screenCenter();

    titleText = new FlxSprite();
    titleText.frames = Paths.getSparrowAtlas('menus/Title/titleEnter');
    titleText.animation.addByPrefix('idle', "Press Enter to Begin", 24);
    titleText.animation.addByPrefix('press', "ENTER PRESSED", 24, false);
    titleText.antialiasing = true;
    titleText.scale.set(.7,.7);
    titleText.animation.play('idle');
    titleText.updateHitbox();
    titleText.screenCenter();
    titleText.y += 300;

    logoBl = new FlxSprite(0,0);
    logoBl.frames = Paths.getSparrowAtlas('menus/Title/logoBumpin');
    logoBl.animation.addByPrefix('bump', 'Logo Bop', 24, true);
    logoBl.updateHitbox();
    logoBl.screenCenter();
    logoBl.scale.set(.4,.4);
    logoBl.x -= 60;
    logoBl.y += 200;

    add(logo);
    add(logoBl);
    add(titleText);
}
function beatHit(){
    logoBl.animation.play('bump');
}
function update(elapsed:Float){   
        if (controls.ACCEPT && !spam)
		{
            FlxG.sound.play(Paths.sound('confirmMenu'));
            titleText.animation.play('press');
            spam = true;

            new FlxTimer().start(1, function(tmr:FlxTimer)
                {
                    FlxG.switchState(new MainMenuState());
                });
            }
    }