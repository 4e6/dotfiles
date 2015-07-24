# Created by newuser for 5.0.5
# The following lines were added by compinstall

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand_alias _expand _complete _correct _ignored _approximate
zstyle ':completion:*' format '-- %d --'
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}'
zstyle ':completion:*' preserve-prefix '//[^/]##/'
zstyle ':completion:*' verbose false

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -e -o pid,%cpu,tty,cputime,cmd'

zstyle ':completion:*' menu select

autoload -Uz compinit
compinit
autoload -U zmv

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd hist_ignore_dups
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install

command -v systemctl &>/dev/null && systemctl --user import-environment PATH DISPLAY

# load other configurations
for file in ~/.zshrc.d/*(N); do
  source "$file"
done
