import funkin.backend.utils.DiscordUtil;
import funkin.backend.scripting.events.DiscordPresenceUpdateEvent;
import funkin.backend.scripting.events.MenuChangeEvent;
import funkin.backend.scripting.events.NameEvent;
import funkin.backend.scripting.EventManager;
import funkin.menus.credits.CreditsMain;
import funkin.options.OptionsMenu;
import funkin.editors.EditorPicker;
import funkin.menus.ModSwitchMenu;
import flixel.addons.display.FlxBackdrop;
import flixel.util.FlxAxes;
import flixel.effects.FlxFlicker;
import funkin.backend.utils.CoolUtil;

import openfl.display.Bitmap;
import openfl.text.TextField;
import openfl.text.TextFormat;
import flixel.text.FlxTextBorderStyle;
import openfl.ui.Keyboard;
import openfl.system.System;
import openfl.text.TextFormat;
import openfl.Lib;
import flixel.FlxG;
import funkin.options.Options;

var curSelected:Int = 0;
var qoute:FlxText;
var person:FlxText;
var charaters:Array<String> = ['0','1','2','3'];
var char:FlxSprite = new FlxSprite();
var portrait:FlxSprite = new FlxSprite(150,90);

function create(){

    var BG:FlxSprite = new FlxSprite().loadGraphic(Paths.image('menus/bios/bg'));
    BG.screenCenter();
    add(BG);

    var smacktext:FlxBackdrop = new FlxBackdrop(Paths.image('menus/bios/text'),FlxAxes.X);
    smacktext.scrollFactor.set();
    smacktext.y = 370;
    smacktext.velocity.x = 180;
    smacktext.alpha = .5;
    smacktext.updateHitbox();
    add(smacktext);

    var smacktext2:FlxBackdrop = new FlxBackdrop(Paths.image('menus/bios/text'),FlxAxes.X);
    smacktext2.scrollFactor.set();
    smacktext2.y = 450;
    smacktext2.velocity.x = 200;
    smacktext2.updateHitbox();
    smacktext2.alpha = .7;
    add(smacktext2);

    var chalk:FlxSprite = new FlxSprite(-100,0).loadGraphic(Paths.image('menus/bios/chalkboard'));
    chalk.setGraphicSize(Std.int(chalk.width * .6));
    add(chalk);

    var hover:FlxSprite = new FlxSprite(600,220).loadGraphic(Paths.image('menus/bios/hover'));
    hover.setGraphicSize(Std.int(hover.width * .5));
    add(hover);

    portrait.scale.set(.6,.6);
    add(portrait);

    char.frames =  Paths.getSparrowAtlas('menus/bios/menu_chars');
    for(a in 0...4)
        char.animation.addByPrefix(Std.string(a), ["dark", "silver", "terios", "sonai"][a], 24);

    char.scale.set(.6,.6);
    add(char);

    var plate:FlxSprite = new FlxSprite(-100,0).loadGraphic(Paths.image('menus/bios/plate'));
    plate.screenCenter();
    plate.setGraphicSize(Std.int(chalk.width * .8));
    plate.y += 280;
    add(plate);

    person = new FlxText(0, 0, 400);
    person.setFormat(Paths.font("Modern Sonic Font.ttf", 1));
    person.setBorderStyle(FlxTextBorderStyle.OUTLINE, FlxColor.BLACK, 1);
    person.borderSize = 2;
    person.size = 40;
    person.scale.set(1.5,1.5);
    person.antialiasing = true;
    person.scrollFactor.set();
    person.screenCenter();
    person.x += 150;
    person.y -= 300;
    add(person);

    qoute = new FlxText(0, 0, 400);
    qoute.setFormat(Paths.font("Modern Sonic Font.ttf", 10));
    qoute.setBorderStyle(FlxTextBorderStyle.OUTLINE, FlxColor.BLACK, 1);
    qoute.borderSize = 3;
    qoute.size = 16;
    qoute.antialiasing = true;
    qoute.scrollFactor.set();
    qoute.setPosition(500,580);
    add(qoute);
}
function update(elapsed:Float)
	{   
        portrait.loadGraphic(Paths.image('menus/bios/' + curSelected));
        char.animation.play(curSelected);

        if (controls.BACK)
		{
            FlxG.switchState(new MainMenuState());
        }
        if (controls.LEFT_P)
        {
            changeItem(-1);
        }
        if (controls.RIGHT_P)
        {
            changeItem(1);
        }
        if (curSelected == 0){
            person.text = "Dark Sonic";
            person.x = 500;
            portrait.setPosition(150,90);
            char.setPosition(760,0);
            portrait.scale.set(.6,.6);
            qoute.size = 14;
            qoute.text = "Voiced by Snap\n\nOne of Sonic's many super forms.\nManifested from his anger & the energy from fake Chaos Emeralds\n";
        }
        else  if (curSelected == 1){
            person.text = "silver";
            person.x = 600;
            portrait.setPosition(150,140);
            char.setPosition(800,150);
            portrait.scale.set(.6,.6);
            qoute.size = 14;
            qoute.text = "Voiced by Luckiibean\n\n Sonic's first robotic doppleganger created by Dr.Eggman\n\nThis guy appearaed in: Sonic 2 8-BIT. Sonic Mania and both Archie and IDW Comics.";
        }
        else  if (curSelected == 2){
            person.text = "Terios";
            person.x = 600;
            portrait.setPosition(150,90);
            portrait.scale.set(.6,.6);
            char.setPosition(780,100);
            qoute.size = 16;
            qoute.text = "Voiced by Begwhi\n\nA character based on one of Shadow's original character Designs for:\nSonic Advanture 2\nGiven the name by the Community.";
        }
        else  if (curSelected == 3){
            person.x = 600;
            person.text = "sonai";
            portrait.scale.set(.6,.59);
            portrait.setPosition(150,85);
            char.setPosition(780,0);
            qoute.size = 12;
            qoute.text = "This is simply EJ's EXE take on the blue blur\n\nIn summary, its an AI that was ment to assist in making Sonic 2 that was\n reactivated in a corrupted copy of the game.\nyears after it's released causing it to be corrupted ITSSELF.";
        }
    }

function changeItem(huh:Int = 0){

    curSelected = FlxMath.wrap(curSelected + huh, 0, charaters.length-1);

}