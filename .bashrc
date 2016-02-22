# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

set -o vi

# User specific aliases and functions

bind -m vi-insert '\c-l':clear-screen
bind -m vi-insert '\c-x':vi-movement-mode
bind -m vi-insert '\c-e':end-of-line
bind -m vi-insert '\c-a':beginning-of-line
bind -m vi-insert '\c-b':backward-char
bind -m vi-insert '\c-f':forward-char
bind -m vi-insert '\c-n':next-history
bind -m vi-insert '\c-p':previous-history
