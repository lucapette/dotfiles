var fullscreen = slate.operation("move", {
    "x" : "screenOriginX",
    "y" : "screenOriginY",
    "width" : "screenSizeX",
    "height" : "screenSizeY"
});

slate.bind("m:ctrl;alt;cmd", function(win) {
    win.doOperation(fullscreen);
});
