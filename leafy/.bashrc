#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

RED="\[$(tput setf 4)\]"
GREEN="\[$(tput setf 2)\]"
TEAL="\[$(tput setf 1)\]"
ORANGE="\[$(tput setf 6)\]"
RESET="\[$(tput sgr0)\]"

alias ls='ls --color=auto'
PS1="${TEAL}[${GREEN}\u${ORANGE}@${GREEN}\h${TEAL} \W]\$ ${RESET}"

force_color_prompt=yes
