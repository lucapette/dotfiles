# Load all my files
for config_file ($HOME/.zsh/*.zsh) source $config_file

## Command history configuration
HISTFILE=$HOME/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups # ignore duplication command history list
setopt hist_ignore_space
setopt inc_append_history
setopt share_history # share command history data

# Changing/making/removing directory
setopt auto_pushd
setopt pushd_ignore_dups

# private configs
if [ -f $HOME/.zshrc_private ]; then
  source $HOME/.zshrc_private
fi

export CDPATH=:$($HOME/bin/projects --cdpath)

# LS colors
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

export GREP_COLOR='1;32'
export GREP_OPTIONS=--color=auto

# Of course
export EDITOR=vim

export PATH=.:$HOME/bin:$HOME/bin/ai:$HOME/.opencode/bin:/usr/local/bin:/usr/local/sbin:$PATH
export PATH=/opt/homebrew/opt/coreutils/libexec/gnubin::$PATH
export PATH=$HOME/.cargo/bin:$PATH

export GOPATH=$HOME/go

export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

export TERM=xterm-256color
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Use a menu for multiple options
zstyle ':completion:*:*:*:*:*' menu select

fpath=(~/.zsh/completions /usr/local/share/zsh-completions $fpath)

# Load the completion system
autoload -U compinit
compinit

compdef g=git
compdef hub=git

source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
eval "$(mcfly init zsh)"
eval "$(kubectl completion zsh)"

source "${HOME}/.sdkman/bin/sdkman-init.sh"
