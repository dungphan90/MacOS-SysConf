#!/bin/bash
alias kinit='kinit ${USER}@FNAL.GOV'
alias ll="ls -lGh"
alias vim-zenv="vim ~/.zenv.sh"
alias code-zenv="code ~/.zenv.sh"
alias top="bpytop"
alias dgit='git --git-dir ~/.dotfiles/.git --work-tree=$HOME'        # Detached working tree to Git the HOME Directory
alias vim="nvim"

# Vagrant: disable VirtualBox auto-sync globally
export VAGRANT_DISABLE_VBOXSYMLINKCREATE=1

# Identify OS
export SYSTEMOS=`uname -s`

# Docker on Linux
if [ "$SYSTEMOS" = "Linux" ]; then
  alias docker="sudo docker"
fi

# CLion on MacOS
if [ "$SYSTEMOS" = "Darwin" ]; then
  alias clion="/Applications/CLion.app/Contents/MacOS/clion"
fi

# Neofetch
if [ "$SYSTEMOS" = "Darwin" ]; then
  alias neofetch="neofetch --iterm2 ~/.girl.jpg --size 19%"
fi

# Set PATH
export PATH="/usr/local/opt/qt/bin:$PATH"
export PATH="$HOME/.emacs.d/bin:$PATH"

# NVIDIA CUDA PATH
if [ "$SYSTEMOS" = "Linux" ]; then
  export PATH=/usr/local/cuda-11.1/bin${PATH:+:${PATH}}
  export LD_LIBRARY_PATH=/usr/local/cuda-11.1/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
fi

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
if [ "$SYSTEMOS" = "Linux" ]; then
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
fi
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# Setup Scientific Python Environment
function setup_scientific_python() {
  source $HOME/PyVEnvs/Scientific/bin/activate
}

# Setup ROOT-system
function setup_root_system() {
  setup_scientific_python
  if [ "$SYSTEMOS" = "Linux" ]; then
    export ROOT_INSTALL=$HOME/ROOT-system/root
  else
    export ROOT_INSTALL=$HOME/ROOT-system/install
  fi

  source $ROOT_INSTALL/bin/thisroot.sh
  alias root="root -l"
}

# Setup Deep Learning Python Environment
function setup_deeplearning_python() {
  source ${HOME}/PyVEnvs/DeepLearning/bin/activate
}

function labnote() {
  if [ $# -gt 0 ]; then 
    cd $1
  else 
    cd ~/PyVEnvs/Notebooks/
  fi
  jupyter lab
}

