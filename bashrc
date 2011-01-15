# Source global definitions
if [ -f /etc/bash.bashrc ]; then
    source /etc/bash.bashrc
fi

# private configs
if [ -f $HOME/Dropbox/bashrc ]; then
    source $HOME/Dropbox/bashrc
fi

# tab completion
for file in $HOME/.bash/completion/*; do
    source $file
done

#Don't put duplicate lines in the history
export HISTCONTROL=ignoredups

#Grep
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;32'

#function to navigate parent directories
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

#My Personal aliases
source $HOME/.bash/aliases

# My super-personal PS1
violet="\[\033[0;35m\]"
red="\[\033[0;31m\]"
cyan="\[\033[1;31m\]"
blue="\[\033[1;34m\]"
green="\[\033[0;32m\]"
black="\[\033[0;30m\]"
branch='$(__git_ps1 "(%s)")'
PS1="$black[$blue\u$cyan@$blue\h \W$green $branch$black]$red\$$black"

export PATH=.:$HOME/code/scripts/inpath:$PATH

#rvm FTW
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
[[ -r $rvm_path/scripts/completion ]] && . $rvm_path/scripts/completion
