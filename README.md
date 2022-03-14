# dotfiles

This repository contains my shell-related configuration files. It doesn't
contain Vim configuration, I use another
[repository](https://github.com/lucapette/vimfiles) for Vim.

As for my vim configuration, I do *not* recommend to use my configuration
files as they are. I think you won't learn much about zsh, tmux and so on just
copying someone else configuration.

I have some small scripts in `~/bin`:

- [bkdir](/bin/bkdir)

  Some time ago I needed to type `cp -R project project.bak` very often so I
  wrote this simple script to save some keystrokes.

- [ff](/bin/ff)

  This one is super simple but I find it surprisingly useful. The script
  accepts a number N and gives you the Nth field from the input list. It's
  just a shortcut for

      awk "{ print N}"

  where N is the argument. And yes, the name of the script makes no sense.

- [git-merged](/bin/git-merged)

  I use this script to delete both my local and remote branches that have been
  merged into master.

- [t](/bin/t)

  This is a shortcut for my personal workflow with `tmux`. First of all I, had
  a problem with tmux 1.7.X since this version adds a default-path feature
  that is not working well with my `set autochdir` in Vim. The script fixes my
  problem and works in combination with `CDPATH` a very nice feature that is
  very useful if you keep all your code in one directory. I even added
  autocompletion for the script. I say *even* because zsh autocompletion is
  magic to me.

# License

[MIT License](/LICENSE) Copyright (c) [Luca Pette](https://lucapette.me)
