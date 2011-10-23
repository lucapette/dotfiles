My dotfiles
===========

This repository includes my configuration files, it also contains a Rakefile for syncing file.

How It works
------------

Just run rake in the project directory to get configurations for:

-   bash

    My bash config loads completion files for git and rake. It also contains
    some personal aliases.
    Furthermore, It loads **rvm** and sets a very personal prompt.

-   gem

    I find very annoying that gem tries to download docs for each gem I try
    to install so I wrote this little file to speed up gem installations.

-   git

    My git config contains usual configs, some aliases and personal colours.
    It also contains a setting to load a global **.gitignore** file.

-   Pry

    Config coming soon

-   ackrc

    My personal preferences for [ack](http://betterthangrep.com)

-   Xmodmap

    You should [remap](http://c2.com/cgi/wiki?RemapCapsLock) caps lock to
    something useful too.

Copyright
---------

Copyright 2011 Luca Pette

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
