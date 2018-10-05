#
# ~/.bashrc
#

export EDITOR='vim'

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

case "$TERM" in
	xterm-color|*-256color|xterm-termite) color_prompt=yes;;
esac

YELLOW="\[\e[30m\e[103m\]"
YELLOWTOCLEAR="\[\e[0m\e[93m\]"
BLACK="\[\e[40m\e[97m\]"
BLACKTOYELLOW="\[\e[103m\e[30m\]"
RESET="\[\e[0m\]"

alias ls='ls --color=auto'
PS1="${BLACK} \u \[\e[93m\]\[\e[97m\] \h ${BLACKTOYELLOW} ${YELLOW}\W ${YELLOWTOCLEAR}${RESET} \[\]"

#powerline-daemon -q
#POWERLINE_BASH_CONTINUATION=1
#POWERLINE_BASH_SELECT=1
#. /usr/lib/python3.7/site-packages/powerline/bindings/bash/powerline.sh
