#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

export TERM=xterm-256color
export TERMINAL=alacritty
export EDITOR=nvim
export VISUAL=nvim
export BROWSER=chromium
export FILE_MANAGER_APP='alacritty -e ranger'
export VIDEO_APP='alacritty -e mpv'
# parallel xz
export XZ_DEFAULTS='-T0'

export NO_AT_BRIDGE=1

PATH=~/bin:~/.local/bin:~/.local/sbin:$PATH
[ -f "/home/dbushev/.ghcup/env" ] && source "/home/dbushev/.ghcup/env" # ghcup-env
[ -d "/home/dbushev/.cargo/bin" ] && PATH=~/.cargo/bin:$PATH #rustup

unset fish_greeting
#if [ -z "$BASH_EXECUTION_STRING" ] && [ -z ${IN_NIX_SHELL+x} ]; then exec fish; fi
if [ -z "$BASH_EXECUTION_STRING" ]; then exec fish; fi
