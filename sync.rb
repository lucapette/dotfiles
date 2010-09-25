#!/usr/bin/ruby

require 'fileutils'

dotfiles=%w{bashrc irbrc railsrc vimrc gitconfig}

#It seeems to be an ugly solution but the best i've found for now.
home=`echo $HOME`
home.chomp!

for dotfile in dotfiles
    unless FileUtils.identical?(dotfile,"#{home}/.#{dotfile}")
        puts "Syncing #{dotfile}"
        FileUtils.cp(dotfile,"#{home}/.#{dotfile}")
    end
end
