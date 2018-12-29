const ctrlAltCmd = ['ctrl', 'alt', 'cmd'];

Key.on('m', ctrlAltCmd, () => {
  const screen = Screen.main().flippedVisibleFrame();
  const window = Window.focused();

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
  const screen = Screen.main().flippedVisibleFrame();
  const window = Window.focused();

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
  const screen = Screen.main().flippedVisibleFrame();
  const window = Window.focused();

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
  const screen = Screen.main().flippedVisibleFrame();
  const window = Window.focused();

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
  const screen = Screen.main().flippedVisibleFrame();
  const window = Window.focused();

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
