# Vi is my home
bindkey -v

bindkey "^r" history-incremental-search-backward

# Let backslash behaves sanely
bindkey "^[[3~" delete-char

# Force myself to not leave the home row
bindkey '^[[A' beep
bindkey '^[[B' beep
bindkey "^[[H" beep
bindkey "^[[1~" beep
bindkey "^[OH" beep
bindkey "^[[F"  beep
bindkey "^[[4~" beep
bindkey "^[OF" beep

# Use ctrl_n and ctrl_p for history navigation
bindkey '^n' up-line-or-search
bindkey '^p' down-line-or-search
