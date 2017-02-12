var ctrlAltCmd = ['ctrl', 'alt', 'cmd'];

Key.on('m', ctrlAltCmd, () => {
  var screen = Screen.main().flippedVisibleFrame();
  var window = Window.focused();

  if (window) {
    window.setTopLeft({
      x: 0,
      y: 0
    });

    window.setSize({
      width: screen.width,
      height: screen.height
    });
  }
});

Key.on('left', ctrlAltCmd, () => {
  var screen = Screen.main().flippedVisibleFrame();
  var window = Window.focused();

  if (window) {
    window.setTopLeft({
      x: 0,
      y: 0
    });

    window.setSize({
      width: screen.width/2,
      height: screen.height
    });
  }
});

Key.on('right', ctrlAltCmd, () => {
  var screen = Screen.main().flippedVisibleFrame();
  var window = Window.focused();

  if (window) {
    window.setTopLeft({
      x: screen.width/2,
      y: 0
    });

    window.setSize({
      width: screen.width/2,
      height: screen.height
    });
  }
});

Key.on('up', ctrlAltCmd, () => {
  var screen = Screen.main().flippedVisibleFrame();
  var window = Window.focused();

  if (window) {
    window.setTopLeft({
      x: 0,
      y: 0
    });

    window.setSize({
      width: screen.width,
      height: screen.height/2
    });
  }
});

Key.on('down', ctrlAltCmd, () => {
  var screen = Screen.main().flippedVisibleFrame();
  var window = Window.focused();

  if (window) {
    window.setTopLeft({
      x: 0,
      y: screen.height/2
    });

    window.setSize({
      width: screen.width,
      height: screen.height/2
    });
  }
});
