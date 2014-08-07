var fullScreen = slate.operation("move", {
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

var halfUp = slate.operation("move", {
    "x" : "screenOriginX",
    "y" : "screenOriginY",
    "width" : "screenSizeX",
    "height" : "screenSizeY/2"
});

var halfDown = slate.operation("move", {
    "x" : "screenOriginX",
    "y" : "screenOriginY+screenSizeY/2",
    "width" : "screenSizeX",
    "height" : "screenSizeY/2"
});

slate.bindAll({
  "j:ctrl;alt;cmd": slate.operation("focus", {"app": 'Google Chrome'}),
  "k:ctrl;alt;cmd": slate.operation("focus", {"app": 'Slack'}),
  "i:ctrl;alt;cmd": slate.operation("focus", {"app": 'iTerm'}),
  "l:ctrl;alt;cmd": slate.operation("focus", {"app": 'LimeChat'}),

  "down:ctrl;alt;cmd": halfDown,
  "left:ctrl;alt;cmd": halfLeft,
  "right:ctrl;alt;cmd": halfRight,
  "up:ctrl;alt;cmd": halfUp,
  "m:ctrl;alt;cmd": fullScreen,
});
