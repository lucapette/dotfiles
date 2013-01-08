# Setup the prompt with pretty colors
setopt prompt_subst

RESET_COLOR="%f%b"

function ruby_version() { echo "%B%F{green}$(~/.rvm/bin/rvm-prompt v p g)" }

function git_branch_name() {
  ref=$(git symbolic-ref --short HEAD 2> /dev/null)
  if [ -z "$ref" ]; then
    ref=$(git reflog 2> /dev/null | grep checkout | head -n1 | awk '{print $NF}')
  fi
  if [ -z "$ref" ]; then
    return
  fi
  echo " %B%F{green}$ref$RESET_COLOR"
}

# Get the status of the working tree
function git_status() {
  STATUS=""
  if [[ -n $(git status -s 2> /dev/null) ]]; then
    STATUS="%B%F{yellow}✗$RESET_COLOR"
  fi
  INDEX=$(git status --porcelain 2> /dev/null)
  if $(echo "$INDEX" | grep '^?? ' &> /dev/null); then
    STATUS="$STATUS%B%F{blue} ?$RESET_COLOR"
  fi
  echo $STATUS
}

PROMPT='%F{red}%m $(ruby_version) %B%F{cyan}%c$RESET_COLOR$(git_branch_name)$(git_status)%F{red} ➜ $RESET_COLOR'
