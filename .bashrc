# append to the history file, don't overwrite it
shopt -s histappend

# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

export PATH="$PATH:$HOME/.rvm/bin:$HOME/.rvm/rubies/ruby-2.2.1/bin:$HOME/.elixir/bin:/usr/local/cuda/bin:/usr/local/cuda-7.5/bin:$HOME/gem5-script" # Add RVM to PATH for scripting
. $HOME/.asdf/asdf.sh

export PKG_CONFIG_PATH="/usr/local/lib/pkgconfig"
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/local/lib:/usr/local/cuda-7.5/lib64:/usr/local/lib/cuda/lib64"
export SWIG="/usr/local/bin/swig"

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
