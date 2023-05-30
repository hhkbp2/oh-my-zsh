# settings ported from .bashrc

# force 256 color gnome-terminal terminfo
#if [[ TERM=="xterm" && COLORTERM==gnome* ]]; then
#    export TERM=”gnome-256color”
#fi

#[ -z "$TMUX" ] && export TERM=xterm-256color
export TERM=xterm-256color

# set language
export LANGUAGE=en_US:en:zh_CN:zh
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# temporary file directory
# it's ok that we don't set it, because in gnu libc P_tmpdir is set to '/tmp'
# refer to <stdio.h>
export TMPDIR=/tmp

## Editor
# set environment variable EDITOR for crontab and mercurial
export EDITOR=vim

# alias settings
alias em='env LC_CTYPE=zh_CN.utf8 emacs -nw --debug-init'

# set my local directory
MY_DIR=${HOME}/dev
MY_LOCAL_DIR=${MY_DIR}/local

# make elem in path uniq
typeset -U path

# add my local bin
if [ -d "${MY_LOCAL_DIR}/bin" ]; then
    PATH=${MY_LOCAL_DIR}/bin:$PATH
fi

# source helper functions
func_file=${MY_LOCAL_DIR}/bin/helper_functions.sh
if [ -f "${func_file}" ]; then
    source "${func_file}"
fi

## C/C++
# set environment virables to add include path for gcc/g++
if [ -d "${MY_LOCAL_DIR}"/include ]; then
    export C_INCLUDE_PATH=${MY_LOCAL_DIR}/include
    export CPLUS_INCLUDE_PATH=${C_INCLUDE_PATH}
fi

# append include path for apue/unp header
APUE_ROOT=${MY_DIR}/pro/topic/linux/apue/src
UNP_ROOT=${MY_DIR}/pro/topic/network/unp/src
if [ -d "${APUE_ROOT}" ]; then
    export C_INCLUDE_PATH=${C_INCLUDE_PATH}:${APUE_ROOT}/include:${UNP_ROOT}
    export CPLUS_INCLUDE_PATH=${C_INCLUDE_PATH}
fi

APUE_LIB=${APUE_ROOT}/lib
if [ -d "${APUE_LIB}" ]; then
    if [ -z "${LDLIBRARIES}" ]; then
        export LDLIBRARIES=${APUE_LIB}
    else
        export LDLIBRARIES=${LDLIBRARIES}:${APUE_LIB}
    fi
fi

## Java
if [ -z "${JAVA_HOME}" ] && [ -d "/usr/lib/jvm/java-7-oracle" ]; then
    export JAVA_HOME=/usr/lib/jvm/java-7-oracle
    export PATH=$JAVA_HOME/bin:$PATH
    if [ -z "$CLASSPATH" ]; then
        export CLASSPATH=.:$JAVA_HOME/lib/jt.jar:$JAVA_HOME/lib/tools.jar
    else
        export CLASSPATH=$CLASSPATH:$JAVA_HOME/lib/jt.jar:$JAVA_HOME/lib/tools.jar
    fi
fi
# set environment for TIJ4
TIJ4_SRC_HOME=${MY_DIR}/pro/lang/java/tij4/TIJ4-code
if [ -d "${TIJ4_SRC_HOME}" ]; then
    export TIJ4_SRC_HOME=${TIJ4_SRC_HOME}
    export CLASSPATH=$CLASSPATH:$TIJ4_SRC_HOME
fi

## Go
if [[ -d "${MY_DIR}/local/opt/go" ]]; then
    export GOROOT=${MY_DIR}/local/opt/go
    export PATH="$GOROOT/bin:$PATH"
fi
# Go module
if [[ -d "${HOME}/go" ]]; then
    export PATH="${HOME}/go/bin:$PATH"
fi

## Rust
if [[ -d "${HOME}/.cargo" ]]; then
    export PATH="${HOME}/.cargo/bin:$PATH"
fi
# Rust source code
if [[ -d "${MY_DIR}/pro/code/rustc-nightly/src" ]]; then
    export RUST_SRC_PATH=${MY_DIR}/pro/code/rustc-nightly/src
fi

## Python
# add module path for python
if [ -d "${MY_DIR}/local/lib/python2.7/site-packages/" ]; then
    if [ -z "$PYTHONPATH" ]; then
        export PYTHONPATH=${MY_DIR}/local/lib/python2.7/site-packages/
    else
        export PYTHONPATH=${MY_DIR}/local/lib/python2.7/site-packages/:$PYTHONPATH
    fi
fi
# python startup script
if [ -z "$PYTHONSTARTUP" ] && [ -f "${HOME}/.pythonstartup" ]; then
    export PYTHONSTARTUP=${HOME}/.pythonstartup
fi

## Ruby
rbenv_bin=${HOME}/.rbenv/bin
if [ -d ${rbenv_bin} ]; then
    export PATH=${rbenv_bin}:$PATH
    eval "$(rbenv init -)"
fi

## Lisp
# set PATH for mit-scheme
mit_scheme_bin=/opt/mit-scheme/bin
if [ -d "${mit_scheme_bin}" ]; then
    export PATH=${PATH}:${mit_scheme_bin}
fi

## Joxa
if command -v joxa &>/dev/null; then
    alias joxa="rlwrap joxa"
fi

## Elixir
if [[ -d "${MY_DIR}/local/opt/elixir" ]]; then
    export ELIXIR_HOME="${MY_DIR}/local/opt/elixir"
    export PATH=$ELIXIR_HOME/bin:$PATH
fi

# Spacemacs
if [[ -d "${MY_DIR}/pro/rep/spacemacs" ]]; then
    alias spacemacs="HOME=${MY_DIR}/pro/rep/spacemacs emacs"
fi

## HG
export HGEDITOR='vim'

## SVN
alias svnwhat="svn st | grep -v -e '^?'"
alias svnview='svn diff | less'
export SVN_EDITOR='vim'
