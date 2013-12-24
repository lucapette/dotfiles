var fullscreen = slate.operation("move", {
    "x" : "screenOriginX",
    "y" : "screenOriginY",
    "width" : "screenSizeX",
    "height" : "screenSizeY"
});

var halfLeft = slate.operation("move", {
    "x" : "screenOriginX",
    "y" : "screenOriginY",
    "width" : "screenSizeX/2",
    "height" : "screenSizeY"
});

var halfRight = slate.operation("move", {
    "x" : "screenOriginX+screenSizeX/2",
    "y" : "screenOriginY",
    "width" : "screenSizeX/2",
    "height" : "screenSizeY"
});

slate.bind("m:ctrl;alt;cmd", function(win) {
    win.doOperation(fullscreen);
});

slate.bind("left:ctrl;alt;cmd", function(win) {
    win.doOperation(halfLeft);
});

slate.bind("right:ctrl;alt;cmd", function(win) {
    win.doOperation(halfRight);
});

var adium = slate.operation("focus", {"app" : 'Adium'});
var chrome = slate.operation("focus", {"app" : 'Google Chrome'});
var skype = slate.operation("focus", {"app" : 'Skype'});
var iterm = slate.operation("focus", {"app" : 'iTerm'});

slate.bind("j:ctrl;alt;cmd", chrome);
slate.bind("l:ctrl;alt;cmd", adium);
slate.bind("k:ctrl;alt;cmd", skype);
slate.bind("i:ctrl;alt;cmd", iterm);
