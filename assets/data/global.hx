import funkin.backend.assets.ModsFolder;
import lime.graphics.Image;
import sys.io.File;

public static var initialized:Bool = false;
public static var spam:Bool = false;


static var redirectStates:Map<FlxState, String> = [
    MainMenuState => "SSS/SSSMain",
    StoryMenuState => "SSS/SSSStory"
    TitleState => "SSS/SSSTitle"
];

function preStateSwitch() {

    for (redirectState in redirectStates.keys())
        if (FlxG.game._requestedState is redirectState)
            FlxG.game._requestedState = new ModState(redirectStates.get(redirectState));
}

function update(elapsed:Float)
	if (FlxG.keys.justPressed.F5) FlxG.resetState();