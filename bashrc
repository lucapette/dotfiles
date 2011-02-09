# source global definitions
if [ -f /etc/bash.bashrc ]; then
    source /etc/bash.bashrc
fi
# private configs
if [ -f $HOME/Dropbox/bashrc ]; then
    source $HOME/Dropbox/bashrc
fi
# sourcing completion files
for file in $HOME/.bash/completion/*; do
    source $file
done
# sourcing personal aliases
source $HOME/.bash/aliases

# don't put duplicate lines in the history
export HISTCONTROL=erasedups
# nice formatting
export HISTTIMEFORMAT='%F %T '
# long list
export HISTSIZE=100000

# grep options
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;32'

# function to go to a parent directory of the current
# directory. It takes the number of directory to ascend as
# argument.
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

export PATH=.:$HOME/code/scripts/bash:$HOME/code/scripts/ruby:$PATH

# loading rvm and its completion FTW
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
[[ -r $rvm_path/scripts/completion ]] && . $rvm_path/scripts/completion

# rvm prompt function, currently not used.
function __rvm_version {
  local gemset=$(echo $GEM_HOME | awk -F'@' '{print $2}')
  [ "$gemset" != "" ] && gemset="@$gemset"
  local version=$(echo $MY_RUBY_HOME | awk -F'-' '{print $2}')
  local full="$version$gemset"
  [ "$full" != "" ] && echo "($full)"
}

# my personal prompt, with git branch
violet="\[\033[0;35m\]"
red="\[\033[0;31m\]"
cyan="\[\033[1;31m\]"
blue="\[\033[1;34m\]"
green="\[\033[0;32m\]"
black="\[\033[0;30m\]"
branch='$(__git_ps1 "(%s)")'

PS1="$black[$blue\u$cyan@$blue\h \W$green $branch$black]$red\$$black"
