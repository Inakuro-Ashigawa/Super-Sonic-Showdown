public var dadZoom:Float = .5;
public var bfZoom:Float = .7;
public var gfZoom:Float = .7;

function update(elapsed:Float){
   
    switch (curCameraTarget){
        case 0: defaultCamZoom = dadZoom;
        case 1: defaultCamZoom = bfZoom;
        case 2: defaultCamZoom = gfZoom;
    }
}