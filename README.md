# dotfiles

This repository contains my shell related configuration files. It doesn't
contain Vim configuration as I use [another
repository](https://github.com/lucapette/vimfiles) for that.

I do _not_ recommend to use my configuration files as they are:

- If learning about shell tools is your goal, you won't learn much about zsh,
  tmux and so on by copying someone else' configuration
- The configuration is tailored to my very specific needs so it won't probably
  fit you.

Having said that, it's open source so feel free to take anything you need :)

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
  merged into main.

- [t](/bin/t)

  This is a shortcut for my personal workflow with `tmux`. First of all, I had a
  problem with tmux 1.7.X since this version adds a default-path feature that is
  not working well with my `set autochdir` in Vim. The script fixes my problem
  and works in combination with `CDPATH` a very nice feature that is very useful
  if you keep all your code in one directory. I even added autocompletion for
  the script. I say _even_ because zsh autocompletion is magic to me.

# License

[MIT License](/LICENSE) Copyright (c) [Luca Pette](https://lucapette.me)
