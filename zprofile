ulimit -S -n 2048

source /usr/local/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh

precmd_functions+=("chruby_auto") # correctly show the ruby version in the prompt
