My dotfiles
===========

This repository contains my shell-related configuration files. It doesn't
contains Vim configurations files since I have them in a [separated repository](https://github.com/lucapette/vimfiles).

As for my vimfiles I recommend **not** to use my configuration files. I think
you won't learn that much and for sure your needs are a bit different than
mine.

In this repository you'll find my customizations of the following tools:

- zsh

  [zsh](http://www.zsh.org/) is very popular alternative to the bash shell. A
  lot of people out there is using
  [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) or
  [pretzo](https://github.com/sorin-ionescu/prezto), I tried them and I do think
  they are both useful but I went for a totally personal configuration because
  this way I have the chance to learn new things from time to time. There is
  nothing noticeable in my zsh configuration but there are comments so you might
  find reading them useful anyway.

- git
- tmux
- ack
- pry
- dotjs

I have some little scripts in `~/bin`. I think this is a very good habit since
some things you need are so specific to your daily workflow that you need to
write a script for it.

- battery

  I just adapted something I found in a gist to my `tmux` needs.

- bkdir

  Some time ago I needed to type `cp -R project project.bak` very often so I
  wrote this stupid script to save some keystrokes.

- ff

  This one is super simple but I find it surprisingly useful. The script accepts
  a number N and gives you the Nth field from the input list. It's just a
  shortcut to

      awk "{ print N}"

  where N is the argument. And yes the name of the script makes no sense.

- merged

  I use this script to delete both my local and remote branches that have been
  merged into master. @github added a button in the pull request pages that made
  the script half useless though.

- t

  This is a shortcut for my personal workflow with `tmux`. First of all I had a
  problem with tmux 1.7.X since this version adds a default-path feature that is
  not working well with my `set autochdir` in Vim. The script fixes my problem
  and works in combination with `CDPATH` a very nice feature that is very useful
  if you keep all your code in one directory. I even added autocompletion for
  the script. I said *even* because zsh autocompletion is still black magic for
  me.

Furthermore there is a
[Rakefile](https://github.com/lucapette/dotfiles/blob/master/Rakefile) I use
for installing/updating files on my machines.
