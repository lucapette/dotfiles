function ruby_prompt() {
  echo "%{$fg_bold[green]%}$(rbenv_prompt_info)"
}

PROMPT='$(ruby_prompt) %{$fg_bold[cyan]%}%c%{$reset_color%}$(git_prompt_info)$(git_prompt_status)%{$fg_bold[red]%} ➜%{$reset_color%} '

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[green]%} "
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[yellow]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg_bold[blue]%} ?%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""
