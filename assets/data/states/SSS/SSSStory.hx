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

function create(){
    var waveSelect:FlxSprite = new FlxSprite().loadGraphic(Paths.image('menus/Story/waveSelect'));
    waveSelect.screenCenter();
    add(waveSelect);

    var wave:FlxSprite = new FlxSprite().loadGraphic(Paths.image('menus/Story/wave1'));
    wave.setGraphicSize(Std.int(wave.width * .5));
    wave.screenCenter();
    add(wave);

}

function update(elapsed:Float)
	{   
        if (controls.BACK)
		{
            FlxG.switchState(new MainMenuState());
        }
        if (controls.ACCEPT ) {
            CoolUtil.playMenuSFX(1, 0.7);
            FlxG.sound.play(Paths.sound('confirmMenu'));
                PlayState.loadWeek({
                    name: "wave1",
                    id: "wave1",
                    sprite: null,
                    chars: [null, null, null],
                    songs: [for (song in ["sleek-and-silver","worked-up","penumbra"]) {name: song, hide: false}],
                    difficulties: ['hard']
                }, "hard");
    
                FlxTween.tween(FlxG.camera, {zoom: 2.1}, 2, {ease: FlxEase.expoInOut});
                FlxG.camera.shake(0.008, 0.08);
                new FlxTimer().start(1, function() {FlxG.switchState(new PlayState());});
            }
    }