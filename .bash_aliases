#!/bin/bash
alias ll='ls -ahlF'
alias la='ls -A'
alias l='ls -CF'
case $(hostname) in
    109-server)
        alias vi='vimx'
        alias v='vi -S ~/Documents/Session.vim'
        alias p='pushd'
        alias d='dirs -v'
        alias grep='grep --color=auto'
        alias fgrep='fgrep --color=auto'
        alias egrep='egrep --color=auto'
        alias ls='ls --color=auto'
        alias gdb='/usr/local/bin/gdb -tui'
        alias t='task';;
    smartMBP)
        alias ctags="/usr/local/bin/ctags";;
    *) ;;
esac
