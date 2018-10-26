#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

export TERMINAL=urxvtc
export EDITOR=nvim
export VISUAL=nvim
export BROWSER=chromium
export FILE_MANAGER_APP='urxvtc -e ranger'
export VIDEO_APP='urxvtc -e mplayer'
# parallel xz
export XZ_DEFAULTS='-T0'

export NO_AT_BRIDGE=1

PATH=~/bin:~/.local/bin:$PATH

unset fish_greeting
if [ -z "$BASH_EXECUTION_STRING" ]; then exec fish; fi
