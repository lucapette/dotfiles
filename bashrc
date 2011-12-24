# source global definitions
if [ -f /etc/bash.bashrc ]; then
  source /etc/bash.bashrc
fi

if [ -f /etc/bash_completion ]; then
 . /etc/bash_completion
fi

# private configs
if [ -f $HOME/Dropbox/bashrc ]; then
  source $HOME/Dropbox/bashrc
fi

# sourcing completion files
for f in $(find $HOME/.bash/completion -name '*.bash'); do source $f; done

# sourcing personal aliases
source $HOME/.bash/aliases.sh

# don't put duplicate lines in the history
export HISTCONTROL=erasedups
# long list
export HISTSIZE=10000

# grep options
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;32'

# function to go to a parent directory of the current directory.
# It takes the number of directory to ascend as argument.
up(){
  local d=""
  limit=$1
  for ((i=1 ; i <= limit ; i++))
  do
    d=$d/..
  done
  d=$(echo $d | sed 's/^\///')
  if [ -z "$d" ]; then
    d=..
  fi
  cd $d
}

# Disable flow-control
stty -ixon

export PATH=.:$HOME/bin:$HOME/android-sdk/tools:$HOME/android-sdk/platform-tools/:$PATH

export CDPATH=~/code:.

# loading rvm and its completion FTW
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
[[ -r $rvm_path/scripts/completion ]] && . $rvm_path/scripts/completion

# my personal prompt, with colours, git current branch and ruby version
function ps_function() {
white="\[\033[0;37m\]"
red="\[\033[0;31m\]"
blue="\[\033[1;34m\]"
green="\[\033[0;32m\]"
branch='$(__git_ps1 "(%s)")'
PS1="$red[$green ($(~/.rvm/bin/rvm-prompt v g)) $blue\u$red@$blue\h \W$green $branch$red]$green\$$white"
}
export PROMPT_COMMAND=ps_function
