function powerline_precmd() {
    PS1="$($HOME/bin/powerline-go -error $? -shell zsh -cwd-max-depth 1 -modules "kube,perms,cwd,git,jobs,exit,root" -theme default)"
}

function install_powerline_precmd() {
  for s in "${precmd_functions[@]}"; do
    if [ "$s" = "powerline_precmd" ]; then
      return
    fi
  done
  precmd_functions+=(powerline_precmd)
}

install_powerline_precmd
