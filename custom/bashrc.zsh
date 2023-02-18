# settings ported from .bashrc

# force 256 color gnome-terminal terminfo
#if [[ TERM=="xterm" && COLORTERM==gnome* ]]; then
#    export TERM=”gnome-256color”
#fi

TERM=xterm-256color
export TERM
#[ -z "$TMUX" ] && export TERM=xterm-256color

# set my local directory
MY_LOCAL_DIR=~/local

# make elem in path uniq
typeset -U path
# add to path
path=(${MY_LOCAL_DIR}/bin $path)

# set environment virables to add include path for gcc/g++
C_INCLUDE_PATH=${MY_LOCAL_DIR}/include
export C_INCLUDE_PATH
CPLUS_INCLUDE_PATH=${C_INCLUDE_PATH}
export CPLUS_INCLUDE_PATH

# append include path for apue/unp header
APUE_ROOT=~/pro/linux/apue/src
#UNP_ROOT=~/pro/unp
C_INCLUDE_PATH=${C_INCLUDE_PATH}:${APUE_ROOT}/include
#\:${UNP_ROOT}/include
CPLUS_INCLUDE_PATH=${C_INCLUDE_PATH}

#LDLIBRARIES=${LDLIBRARIES}:${APUE_ROOT}/lib

# set makefile template file path
MAKE_TEMPLATE_DIR=${MY_LOCAL_DIR}/make_template
export MAKE_TEMPLATE_DIR

# source helper functions
func_file=${MY_LOCAL_DIR}/bin/helper_functions.sh
if [[ -f "${func_file}" ]]; then
   source "${func_file}"
fi

# set environment variable EDITOR for crontab and mercurial
EDITOR=vim
export EDITOR

# alias settings
alias em='env LC_CTYPE=zh_CN.utf8 emacs -nw --debug-init'
#alias em='env LC_CTYPE=zh_CN.utf8 emacsclient -nw -a "" -s "$HOME/.emacs.d/server/server"'
alias ipy='ipython'

# set language
LANGUAGE=en_US:en:zh_CN:zh
export LANGUAGE
LANG=en_US.UTF-8
export LANG
LC_ALL=en_US.UTF-8
export LC_ALL

# temporary file directory
# it's ok that we don't set it, because in gnu libc P_tmpdir is set to '/tmp'
# refer to <stdio.h>
TMPDIR=/tmp

# add module path for python
if [[ -z "$PYTHONPATH" ]]; then
    export PYTHONPATH=${HOME}/local/lib/python2.7/site-packages/
else
    export PYTHONPATH=${HOME}/local/lib/python2.7/site-packages/:$PYTHONPATH
fi

# set environment for TIJ4
TIJ4_SRC_HOME=~/prog/java/tij4/TIJ4-code/
CLASSPATH=$CLASSPATH:$TIJ4_SRC_HOME


## python startup script
export PYTHONSTARTUP=~/.pythonstartup

# hg
export HGEDITOR='vim'

# svn
alias svnwhat="svn st | grep -v -e '^?'"
alias svnview='svn diff | less'
export SVN_EDITOR='vim'

if [[ "$(uname -s)" = "Linux" ]]; then
    # sun java
    if [[ -d /usr/lib/jvm/jdk-7-oracle-x64/ ]]; then
        export JAVA_HOME=/usr/lib/jvm/jdk-7-oracle-x64/
        export PATH="$PATH:$JAVA_HOME/bin"
        export CLASSPATH=$JAVA_HOME/lib/:$JAVA_HOME/jre/lib/
    fi

    # texlive
    if [[ -d "$HOME/local/opt/texlive/bin/x86_64-linux" ]]; then
        export PATH="$HOME/local/opt/texlive/bin/x86_64-linux:$PATH"
    fi
fi

# mac specified stuff
os_type=$(uname -s)
if [[ "${os_type}" = 'Darwin' ]]; then
    # use coreutils tools instead of the mac default freebsd one
    export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
    # use gnu sed
    export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
    # use gnu tar
    export PATH="/usr/local/opt/gnu-tar/libexec/gnubin:$PATH"

    # manpath settings
    if [[ -z $MANPATH ]]; then
        export MANPATH="/usr/local/share/man:/usr/share/man"
    else
        export MANPATH="/usr/local/share/man:/usr/share/man:$MANPATH"
    fi
    export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
    export MANPATH="/usr/local/opt/gnu-sed/libexec/gnuman:$MANPATH"

    # use homebrew-installed gnu command tools instead of the mac bsd ones
    export PATH="/usr/local/sbin:/usr/local/bin:$PATH"
fi

### alias
if command -v joxa &>/dev/null; then
    alias joxa="rlwrap joxa"
fi

### elixir
if [[ -d "$HOME/local/opt/elixir" ]]; then
    export ELIXIR_HOME="$HOME/local/opt/elixir"
    export PATH=$ELIXIR_HOME/bin:$PATH
fi

# add linux manpages
if [[ -d "$HOME/local/share/man" ]]; then
    export MANPATH="$HOME/local/share/man:$MANPATH"
fi

# spacemacs
if [[ -d "$HOME/pro/rep/spacemacs" ]]; then
    alias spacemacs="HOME=~/pro/rep/spacemacs emacs"
fi


# go
if [[ -d "$HOME/local/opt/go" ]]; then
    export GOROOT=$HOME/local/opt/go
    export PATH="$GOROOT/bin:$PATH"
fi
# go module
if command -v go &>/dev/null; then
    export GOMODULEROOT=$HOME/go
    export PATH="$GOMODULEROOT/bin:$PATH"
fi

# rust
if [[ -d "$HOME/.cargo" ]]; then
    export CARGO_HOME=$HOME/.cargo
    export PATH="$HOME/.cargo/bin:$PATH"
fi
# rust source code
if [[ -d "$HOME/pro/code/rustc-nightly/src" ]]; then
    export RUST_SRC_PATH=$HOME/pro/code/rustc-nightly/src
fi

# avr-gcc
# AVR_GCC_BIN=/usr/local/opt/avr-gcc@8/bin
# if [ -d "$AVR_GCC_BIN" ]; then
#     export PATH="$AVR_GCC_BIN:$PATH"
# fi


# for Mac OS X
# Mountain Lion (version 10.8)
# Lion (version 10.7)
# and Sierra (version 10.12) above
# function clean-dns {
#     sudo dscacheutil -flushcache && sudo killall -HUP mDNSResponder
# }

# for Mac OS X
# El Capitan (version 10.11)
# Mavericks (version 10.9)
function clean-dns {
    sudo dscacheutil -flushcache && sudo killall -HUP mDNSResponder
}
