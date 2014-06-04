
export LANGUAGE='en_US.UTF-8'
export LC_ALL='en_US.UTF-8'

 RESET="\[\017\]"
NORMAL="\[\033[0m\]"
   RED="\[\033[31;1m\]"
 GREEN="\[\033[32;1m\]"
YELLOW="\[\033[33;1m\]"
  BLUE="\[\033[34;1m\]"
PURPLE="\[\033[35;1m\]"
  CYAN="\[\033[36;1m\]"
 WHITE="\[\033[37;1m\]"

   DIR_COLOR=$YELLOW
BRANCH_COLOR=$WHITE
MAX_BRANCH_LENGTH=20

function current_branch {
  git rev-parse --abbrev-ref HEAD
}

function git_ps1 {
  if [ -d '.git' ]; then
    GIT_PS1=$(current_branch)
    if [ $(expr length $GIT_PS1) -gt $MAX_BRANCH_LENGTH ]; then
      GIT_PS1="${GIT_PS1:0:${MAX_BRANCH_LENGTH-2}}.."
    fi
    echo " [${GIT_PS1}]"
  fi
}

function prompt_command {
  export PS1="${DIR_COLOR}\W${BRANCH_COLOR}$(git_ps1) ${NORMAL}\$ "
  # export PS1=$(~/bin/bash_prompt)
}

export PROMPT_COMMAND=prompt_command

