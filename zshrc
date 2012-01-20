ZSH=$HOME/.oh-my-zsh

CASE_SENSITIVE="true"

plugins=(bundler cake command-not-found rake rvm)

ZSH_CUSTOM=$HOME/.zsh

source $ZSH/oh-my-zsh.sh

# private configs
if [ -f $HOME/Dropbox/zshrc ]; then
  source $HOME/Dropbox/zshrc
fi

compdef hub=git

export PATH=.:$HOME/bin:$HOME/android-sdk/tools:$HOME/android-sdk/platform-tools/:$PATH

export CDPATH=:$HOME/code

# loading rvm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
