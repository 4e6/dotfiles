# sudo
alias sudo='sudo '
alias reboot='sudo reboot'
alias poweroff='sudo poweroff'
alias wifi-menu='sudo wifi-menu'
alias tlp='sudo tlp'
alias wifi='sudo wifi'
alias bluetooth='sudo bluetooth'

# util
alias ls='ls -h --color'
alias ll='ls -l'
alias la='ls -la'
alias -g grep='grep --color'

compdef ll=ls la=ls

# docker

docker() {
  case "$@" in
    inspect* ) shift; docker_inspect "$@" ;;
    * ) command docker "$@" ;;
  esac
}

docker_inspect() {
  case "$@" in
    ip* ) shift; command docker inspect --format '{{ .NetworkSettings.IPAddress }}' "$@" ;;
    pid* ) shift; command docker inspect --format '{{ .State.Pid }}' "$@" ;;
    * ) command docker inspect "$@" ;;
  esac
}
