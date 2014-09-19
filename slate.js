var fullScreen = S.op("move", {
    "x" : "screenOriginX",
    "y" : "screenOriginY",
    "width" : "screenSizeX",
    "height" : "screenSizeY"
});

var halfLeft = S.op("move", {
    "x" : "screenOriginX",
    "y" : "screenOriginY",
    "width" : "screenSizeX/2",
    "height" : "screenSizeY"
});

var halfRight = S.op("move", {
    "x" : "screenOriginX+screenSizeX/2",
    "y" : "screenOriginY",
    "width" : "screenSizeX/2",
    "height" : "screenSizeY"
});

var halfUp = S.op("move", {
    "x" : "screenOriginX",
    "y" : "screenOriginY",
    "width" : "screenSizeX",
    "height" : "screenSizeY/2"
});

var halfDown = S.op("move", {
    "x" : "screenOriginX",
    "y" : "screenOriginY+screenSizeY/2",
    "width" : "screenSizeX",
    "height" : "screenSizeY/2"
});

slate.bindAll({
  "i:ctrl;alt;cmd": S.op("focus", {"app": 'iTerm'}),
  "j:ctrl;alt;cmd": S.op("focus", {"app": 'Firefox'}),
  "k:ctrl;alt;cmd": S.op("focus", {"app": 'Slack'}),
  "l:ctrl;alt;cmd": S.op("focus", {"app": 'LimeChat'}),
  "m:ctrl;alt;cmd": fullScreen,

  "down:ctrl;alt;cmd": halfDown,
  "left:ctrl;alt;cmd": halfLeft,
  "right:ctrl;alt;cmd": halfRight,
  "up:ctrl;alt;cmd": halfUp,

  "right:ctrl;alt;shift": S.op("resize", { "width" : "+10%", "height" : "+0" }),
  "left:ctrl;alt;shift":  S.op("resize", { "width" : "-10%", "height" : "+0" }),
  "up:ctrl;alt;shift":    S.op("resize", { "width" : "+0", "height" : "-10%" }),
  "down:ctrl;alt;shift":  S.op("resize", { "width" : "+0", "height" : "+10%" }),

  "right:ctrl;alt": S.op("nudge", { "x" : "+10%", "y" : "+0" }),
  "left:ctrl;alt":  S.op("nudge", { "x" : "-10%", "y" : "+0" }),
  "up:ctrl;alt":    S.op("nudge", { "x" : "+0", "y" : "-10%" }),
  "down:ctrl;alt":  S.op("nudge", { "x" : "+0", "y" : "+10%" }),

  "esc:cmd" : S.op("hint"),
});
