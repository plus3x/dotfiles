# [[ -z "$TMUX" ]] && exec tmux

 RESET="\[\017\]"
NORMAL="\[\033[0m\]"
   RED="\[\033[31;1m\]"
 GREEN="\[\033[32;1m\]"
YELLOW="\[\033[33;1m\]"
  BLUE="\[\033[34;1m\]"
PURPLE="\[\033[35;1m\]"
  CYAN="\[\033[36;1m\]"
 WHITE="\[\033[37;1m\]"

   DIR_COLOR=$BLUE
BRANCH_COLOR=$GREEN
MAX_BRANCH_LENGTH=20

function current_git_branch {
  git symbolic-ref -q --short HEAD
}

function is_a_git_repo? {
  git rev-parse --git-dir > /dev/null 2>&1 && true
}

function git_ps1 {
  if is_a_git_repo? ; then
    BRANCH=$(current_git_branch)
    BRANCH_LENGTH=$(echo ${#BRANCH})
    if [[ $BRANCH_LENGTH -gt $MAX_BRANCH_LENGTH ]]; then
      BRANCH="${BRANCH:0:${MAX_BRANCH_LENGTH-2}}.."
    fi
    echo " [${BRANCH}]"
  fi
}

function prompt_command {
  export PS1="${DIR_COLOR}\W${BRANCH_COLOR}$(git_ps1) ${NORMAL}\$ "
  # export PS1=$(~/bin/bash_prompt)
}

export LANGUAGE='en_US.UTF-8'
export LC_ALL='en_US.UTF-8'
export PROMPT_COMMAND=prompt_command
export PATH="bin:$PATH"