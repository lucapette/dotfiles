ZSH=$HOME/.oh-my-zsh

ZSH_THEME="robbyrussell"

CASE_SENSITIVE="true"

plugins=(bundler cake command-not-found rvm)

source $ZSH/oh-my-zsh.sh

# private configs
if [ -f $HOME/Dropbox/zshrc ]; then
  source $HOME/Dropbox/zshrc
fi

alias c='rails c'
alias core_ext='cd $HOME/code/rails/activesupport/lib/active_support/core_ext'
alias cr2jpg='ufraw-batch *.CR2 --wb=auto --exposure=1.0 --out-type=jpeg --compression=100'
alias d='cd $HOME/Dropbox'
alias h='history'
alias jekyll='jekyll --server --pygments'
alias lr='ls -lR' # recursive ls
alias ls='ls -hF --color' # add colors for filetype recognition
alias mkdir='mkdir -p'
alias nautilus='nautilus .'
alias old='cd -'
alias ps='ps aux | more'
alias psgrep='ps | grep'
alias rm='rm -i'
alias rvmrc='rvm use 1.9.2@${PWD##*/} --create --rvmrc'
alias s='rails s'
alias vi='gvim -O'
alias vim='gvim -O'


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

function rvm_prompt() {
echo "($(~/.rvm/bin/rvm-prompt v g))"
}

PROMPT="%{$fg[green]%}\$(rvm_prompt) %{$fg_bold[blue]%}%c %{$reset_color%}\$(git_prompt_info) %{$fg_bold[red]%}$ %{$reset_color%}"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[yellow]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%}"

# loading rvm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
