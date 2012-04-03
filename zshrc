ZSH=$HOME/.oh-my-zsh

CASE_SENSITIVE="true"

plugins=(command-not-found rake rvm)

ZSH_CUSTOM=$HOME/.zsh

source $ZSH/oh-my-zsh.sh

# private configs
if [ -f $HOME/Dropbox/zshrc ]; then
  source $HOME/Dropbox/zshrc
fi

compdef hub=git

export CDPATH=:$HOME/code

export EDITOR=vim

# loading rvm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

export PATH=.:./bin:$HOME/bin:$PATH
