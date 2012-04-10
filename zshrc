ZSH=$HOME/.oh-my-zsh

CASE_SENSITIVE="true"

DISABLE_AUTO_TITLE="true"

plugins=(command-not-found rake rbenv)

ZSH_CUSTOM=$HOME/.zsh

source $ZSH/oh-my-zsh.sh

# private configs
if [ -f $HOME/Dropbox/zshrc ]; then
  source $HOME/Dropbox/zshrc
fi

compdef hub=git

export CDPATH=:$HOME/code

export EDITOR=vim

export PATH=.:./bin:$HOME/bin:$PATH
