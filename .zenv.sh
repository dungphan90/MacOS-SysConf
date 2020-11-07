#!/bin/bash
alias kinit='kinit ${USER}@FNAL.GOV'
alias ll="ls -laGh"
alias zenv="vim ~/.zenv.sh"


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

export PATH=/Users/dphan/Library/Python/3.8/bin:${PATH}

function setup_sciPyEnv() {
    source ~/Utilities/PyEnvs/ScientificComputing/bin/activate
}

function run_pynote() {
    cd ~/Utilities/PyEnvs/Notebooks
    jupyter lab
}

function cheat() {
  curl cheat.sh/$1
}

export PATH="/usr/local/opt/qt/bin:$PATH"
export PATH="$HOME/.emacs.d/bin:$PATH"

# Using PyEnv Python 3.7.3
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
alias dgit='git --git-dir ~/.dotfiles/.git --work-tree=$HOME'
