#!/usr/bin/ruby

require 'fileutils'

dotfiles=%w{bashrc irbrc railsrc vimrc gitconfig gemrc vim}

#It seeems to be an ugly solution but the best i've found for now.
home=`echo $HOME`
home.chomp!

for dotfile in dotfiles
        puts "Syncing #{dotfile}"
        FileUtils.cp_r(dotfile,"#{home}/.#{dotfile}")
end
