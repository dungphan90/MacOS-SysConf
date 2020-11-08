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

# Setup Scientific Python Environment (/home/dphan/PyVEnvs/Scientific)
function setup_scientific_python() {
  source $HOME/PyVEnvs/Scientific/bin/activate

  ## Python 3.8.3
  ## Package             Version
  ## ------------------- ---------
  ## argon2-cffi         20.1.0
  ## async-generator     1.10
  ## attrs               20.3.0
  ## backcall            0.2.0
  ## bleach              3.2.1
  ## certifi             2020.6.20
  ## cffi                1.14.3
  ## chardet             3.0.4
  ## cycler              0.10.0
  ## decorator           4.4.2
  ## defusedxml          0.6.0
  ## entrypoints         0.3
  ## idna                2.10
  ## ipykernel           5.3.4
  ## ipython             7.19.0
  ## ipython-genutils    0.2.0
  ## jedi                0.17.2
  ## Jinja2              2.11.2
  ## json5               0.9.5
  ## jsonschema          3.2.0
  ## jupyter-client      6.1.7
  ## jupyter-core        4.6.3
  ## jupyterlab          2.2.9
  ## jupyterlab-pygments 0.1.2
  ## jupyterlab-server   1.2.0
  ## kiwisolver          1.3.1
  ## MarkupSafe          1.1.1
  ## matplotlib          3.3.2
  ## mistune             0.8.4
  ## nbclient            0.5.1
  ## nbconvert           6.0.7
  ## nbformat            5.0.8
  ## nest-asyncio        1.4.2
  ## notebook            6.1.5
  ## numpy               1.19.4
  ## packaging           20.4
  ## pandas              1.1.4
  ## pandocfilters       1.4.3
  ## parso               0.7.1
  ## pexpect             4.8.0
  ## pickleshare         0.7.5
  ## Pillow              8.0.1
  ## pip                 20.2.4
  ## prometheus-client   0.8.0
  ## prompt-toolkit      3.0.8
  ## ptyprocess          0.6.0
  ## pycparser           2.20
  ## Pygments            2.7.2
  ## pyparsing           2.4.7
  ## pyrsistent          0.17.3
  ## python-dateutil     2.8.1
  ## pytz                2020.4
  ## pyzmq               19.0.2
  ## requests            2.24.0
  ## scipy               1.5.4
  ## Send2Trash          1.5.0
  ## setuptools          50.3.2
  ## six                 1.15.0
  ## terminado           0.9.1
  ## testpath            0.4.4
  ## tornado             6.1
  ## traitlets           5.0.5
  ## urllib3             1.25.11
  ## wcwidth             0.2.5
  ## wheel               0.35.1
  ## webencodings        0.5.1
}
