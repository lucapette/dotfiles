# Source global definitions
if [ -f /etc/bashrc ]; then
	source /etc/bashrc
fi

# good function to navigate parent directories
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


#git bash completion, really useful.
if [ -f /etc/bash_completion.d/git ]; then
    source /etc/bash_completion.d/git
fi

# my personal aliases
alias rm='rm -i'
alias vi="vim -p"
alias vim="vim -p"
alias ps='ps aux|grep -v ps|grep -v grep|more'
alias psgrep='ps|grep'
alias d="cd $HOME/Dropbox"
alias cl='clear'
alias x+='sudo chmod +x'
alias x-='sudo chmod -x'
alias w+='sudo chmod +w'
alias w-='chmod -w'
alias cls='cl;ls'
alias old='cd $OLDPWD'
alias h='history'
alias hgrep='h|grep'
alias nautilus='nautilus .'
alias la='ls -Al' # show hidden files
alias ls='ls -hF --color' # add colors for filetype recognition
alias lx='ls -lXB' # sort by extension
alias lk='ls -lSr' # sort by size
alias lc='ls -lcr' # sort by change time
alias lu='ls -lur' # sort by access time
alias lr='ls -lR' # recursive ls
alias lt='ls -ltr' # sort by date
alias diskspace="du -S|sort -n -r|more"
alias fgrep="find . -type f -print0 | xargs -0 grep -n"

#Setting PS1 Colours
violet="\[\033[0;35m\]"
red="\[\033[0;31m\]"
cyan="\[\033[1;31m\]"
blue="\[\033[1;34m\]"
green="\[\033[0;32m\]"
black="\[\033[0;30m\]"
PS1="$violet[$blue\u$cyan@$blue\h \W $violet]$red\$"

PATH=.:/var/lib/gems/1.8/bin:$PATH
