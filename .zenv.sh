#!/bin/bash
alias kinit='kinit ${USER}@FNAL.GOV'
alias ll="ls -lGh"
alias vim-zenv="vim ~/.zenv.sh"
alias code-zenv="code ~/.zenv.sh"
alias top="bpytop"
alias dgit='git --git-dir ~/.dotfiles/.git --work-tree=$HOME'        # Detached working tree to Git the HOME Directory
alias vim="nvim"

# Set PATH
export PATH="/usr/local/opt/qt/bin:$PATH"
export PATH="$HOME/.emacs.d/bin:$PATH"

# FNAL connections
function minosgpvm() {
    if ! klist -s
    then
        kinit
    fi

    if [ $# -gt 0 ];
    then
        ssh -XY dphan@minosgpvm$1.fnal.gov
    else
        ssh -XY dphan@minosgpvm06.fnal.gov
    fi

}

function novagpvm() {
    if ! klist -s
    then
        kinit
    fi

    if [ $# -gt 0 ];
    then
        ssh -XY dphan@novagpvm$1.fnal.gov
    else
        ssh -XY dphan@novagpvm06.fnal.gov
    fi

}

# Utility functions
function cheat() {
  curl cheat.sh/$1
}

# Using PyEnv
# First check if the HOST is Linux
export SYSTEMOS=`uname -s`
if [ "$SYSTEMOS" = "Linux" ]; then
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
fi
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

