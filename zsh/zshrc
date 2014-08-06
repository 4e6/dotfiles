# Created by newuser for 5.0.5
# The following lines were added by compinstall

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _complete _ignored
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}'
zstyle ':completion:*' preserve-prefix '//[^/]##/'
zstyle ':completion:*' verbose false

autoload -Uz compinit
compinit
#autoload -U promptinit
#promptinit

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install

typeset -U path
path=(~/bin $path)

[[ -f /usr/share/doc/pkgfile/command-not-found.zsh ]] && source /usr/share/doc/pkgfile/command-not-found.zsh
[[ -f ~/.zshrc.prompt ]] && source ~/.zshrc.prompt
[[ -f ~/.zshrc.alias ]] && source ~/.zshrc.alias
