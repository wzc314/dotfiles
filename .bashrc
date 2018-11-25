function init_109 {
    # If not running interactively, don't do anything
    case $- in
        *i*) ;;
          *) return;;
    esac

    if [ -n "$force_color_prompt" ]; then
        if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        # We have color support; assume it's compliant with Ecma-48
        # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
        # a case would tend to support setf rather than setaf.)
        color_prompt=yes
        else
        color_prompt=
        fi
    fi

    if [ "$color_prompt" = yes ]; then
        PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
    else
        PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
    fi
    unset color_prompt force_color_prompt

    # If this is an xterm set the title to user@host:dir
    case "$TERM" in
        xterm*|rxvt*) PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1";;
        *) ;;
    esac

    . $HOME/.asdf/asdf.sh
    export PATH="$PATH:$HOME/.rvm/bin:$HOME/.rvm/rubies/ruby-2.2.1/bin:$HOME/.elixir/bin:/usr/local/cuda/bin:/usr/local/cuda-7.5/bin:$HOME/gem5-script"
    export PKG_CONFIG_PATH="/usr/local/lib/pkgconfig"
    export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/local/lib:/usr/local/cuda-7.5/lib64:/usr/local/lib/cuda/lib64"
    export SWIG="/usr/local/bin/swig"
    export EDITOR="vimx"
}

case `hostname` in
    109-server) init_109;;
    *) ;;
esac

# append to the history file, don't overwrite it
shopt -s histappend
# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth
HISTSIZE=3000
HISTFILESIZE=3000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

stty stop 'undef'

set -o vi
bind -m vi-insert '\c-l':clear-screen
bind -m vi-insert '\c-e':end-of-line
bind -m vi-insert '\c-a':beginning-of-line
bind -m vi-insert '\c-b':backward-char
bind -m vi-insert '\c-f':forward-char
bind -m vi-insert '\c-n':next-history
bind -m vi-insert '\c-p':previous-history
bind -m vi-insert '\c-d':delete-char
bind -m vi-insert '\c-k':kill-line
