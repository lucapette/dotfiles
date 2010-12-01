#!/usr/bin/ruby

require 'fileutils'

dotfiles=%w{bashrc irbrc railsrc vimrc gitconfig gemrc}

home=`echo $HOME`
home.chomp!

for dotfile in dotfiles
        puts "Syncing #{dotfile}"
        FileUtils.cp_r(dotfile,"#{home}/.#{dotfile}")
end
