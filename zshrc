source /etc/profile

# Setup handy keys
alias zkbd='zsh /usr/share/zsh/functions/Misc/zkbd'
autoload zkbd
[[ ! -d ~/.zkbd ]] && mkdir ~/.zkbd
[[ ! -f ~/.zkbd/$TERM-$DISPLAY ]] && zkbd 

source ~/.zkbd/$TERM-$DISPLAY
[[ -n ${key[Home]}    ]]  && bindkey  "${key[Home]}"    beginning-of-line
[[ -n ${key[End]}     ]]  && bindkey  "${key[End]}"     end-of-line
[[ -n ${key[Insert]}  ]]  && bindkey  "${key[Insert]}"  overwrite-mode
[[ -n ${key[Delete]}  ]]  && bindkey  "${key[Delete]}"  delete-char
[[ -n ${key[Up]}      ]]  && bindkey  "${key[Up]}"      up-line-or-history
[[ -n ${key[Down]}    ]]  && bindkey  "${key[Down]}"    down-line-or-history
[[ -n ${key[Left]}    ]]  && bindkey  "${key[Left]}"    backward-char
[[ -n ${key[Right]}   ]]  && bindkey  "${key[Right]}"   forward-char
[[ -n ${key[Backspace]}   ]]  && bindkey  "${key[Backspace]}"   backward-delete-char
# PageUp & PageDown
bindkey "^[[5~" up-line-or-history
bindkey "^[[6~" down-line-or-history

# Autoload zsh modules when they are referenced 
zmodload -a zsh/stat stat
zmodload -a zsh/zpty zpty
zmodload -a zsh/zprof zprof
zmodload -ap zsh/mapfile mapfile

# Completions
zstyle ':completion:*::::' completer _expand _complete _ignored _approximate
zstyle -e ':completion:*:approximate:*' max-errors 'reply=( $(( ($#PREFIX+$#SUFFIX)/3 )) numeric )'
zstyle ':completion:*:expand:*' tag-order all-expansions
zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format '%B%d%b'
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format 'No matches for: %d'
zstyle ':completion:*:corrections' format '%B%d (errors: %e)%b'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters
zstyle ':completion:*:*:(^rm):*:*files' ignored-patterns '*?.o' '*?.c~''*?.old' '*?.pro'
zstyle ':completion:*:functions' ignored-patterns '_*'
# Nice 'kill' completion
zstyle ':completion:*:*:kill:*:processes' list-colors "=(#b) #([0-9]#)*=$color[cyan]=$color[red]"
# Rebuild autocomplete index
zstyle ':completion:*commands' rehash 1

# Menu for autocomplete
zstyle ':completion:*' menu yes select
#zstyle ':completion:*' yes select

autoload -Uz compinit && compinit

# History
HISTFILE=~/.histfile
HISTSIZE=1000
# Number of commands in history
SAVEHIST=1000
# Append history
setopt APPEND_HISTORY
# Ignore all duplicates
setopt HIST_IGNORE_ALL_DUPS
# Ignore extra spaces
setopt HIST_IGNORE_SPACE
# No beep
setopt NO_BEEP
# Change directory when 'cd' missing
setopt AUTO_CD
# Correct mistyped commands
setopt CORRECT_ALL
# ZSH will handle spaces like BASH
setopt SH_WORD_SPLIT
# Last commands in the beginning of the file
# and do not store duplicates
setopt histexpiredupsfirst histfindnodups
setopt histignoredups histnostore histverify histignorespace extended_history share_history

# Various shell options
setopt   notify globdots correct pushdtohome cdablevars autolist
setopt   correctall autocd recexact longlistjobs
setopt   autoresume histignoredups pushdsilent noclobber
setopt   autopushd pushdminus extendedglob rcquotes mailwarning
unsetopt bgnice autoparamslash
# Do not threat Control-C as exit from shell
setopt IGNORE_EOF
#? Remove duplicates from this array
typeset -U path cdpath fpath manpath
# Load colors
autoload colors && colors

#
# Prompt
# http://zsh.git.sourceforge.net/git/gitweb.cgi?p=zsh/zsh;a=blob;f=Misc/vcs_info-examples
autoload -Uz vcs_info

zstyle ':vcs_info:*+*:*' debug false
zstyle ':vcs_info:*' stagedstr '%F{green}•%f'
zstyle ':vcs_info:*' unstagedstr '%F{yellow}✚%f'
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{red}:%f%F{yellow}%r%f'
zstyle ':vcs_info:*' enable git svn
zstyle ':vcs_info:git*+set-message:*' hooks git-untracked git-st

### Display the existence of files not yet known to VCS
### git: Show marker (T) if there are untracked files in repository
# Make sure you have added staged to your 'formats':  %c

+vi-git-untracked(){
  if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
    git status --porcelain | grep '??' &> /dev/null ; then
  # This will show the marker if there are any untracked files in repo.
  # If instead you want to show the marker only if there are untracked
  # files in $PWD, use:
  #[[ -n $(git ls-files --others --exclude-standard) ]] ; then
  hook_com[unstaged]+='%F{red}…%f'
  fi
}

### Compare local changes to remote changes
### git: Show +N/-N when your local branch is ahead-of or behind remote HEAD.
# Make sure you have added misc to your 'formats':  %m

function +vi-git-st() {
  local ahead behind
  local -a gitstatus

  # for git prior to 1.7
  # ahead=$(git rev-list origin/${hook_com[branch]}..HEAD | wc -l)
  ahead=$(git rev-list ${hook_com[branch]}@{upstream}..HEAD 2>/dev/null | wc -l)
  (( $ahead )) && gitstatus+=( "↑${ahead}" )

  # for git prior to 1.7
  # behind=$(git rev-list HEAD..origin/${hook_com[branch]} | wc -l)
  behind=$(git rev-list HEAD..${hook_com[branch]}@{upstream} 2>/dev/null | wc -l)
  (( $behind )) && gitstatus+=( "↓${behind}" )

  #hook_com[misc]+=${(j:/:)gitstatus}
  hook_com[misc]+=${gitstatus}
}

precmd () { vcs_info }

zstyle ':vcs_info:*' formats '[%F{blue}%b%F{grey}%m%f%c%u%F{green}]'

# Detects the VCS and shows the appropriate sign
function prompt_char {
  git branch >/dev/null 2>/dev/null && echo '±' && return
  hg root >/dev/null 2>/dev/null && echo '☿' && return
  svn info >/dev/null 2>/dev/null && echo '⚡' && return
  echo '%#'
}

# Enables additional prompt extentions
setopt prompt_subst

PROMPT='%F{cyan}%c%f %F{green}${vcs_info_msg_0_}%f%F{grey}$(prompt_char)%f '
RPROMPT='%F{grey}%~/%f %(?.%F{green}:%)%f.%F{red}:(%f)'

# Escape special characters in urls like &,?,~
autoload -U url-quote-magic
zle -N self-insert url-quote-magic

#
# Hotkeys
#
# Move to parent directories ... -> ../..
dot() {
  if [[ $LBUFFER = *.. ]]; then
    LBUFFER+=/..
  else
    LBUFFER+=.
  fi
}

autoload -U dot
zle -N dot
bindkey . dot

# Predict history: ^X^Z on; ^Z off
autoload -U predict-on
zle -N predict-on
zle -N predict-off
bindkey -M emacs "^X^Z" predict-on
bindkey -M emacs "^Z" predict-off

# Emacs-style navigation
bindkey -e

# Edit mode call $EDITOR
autoload -U edit-command-line

# Call $EDITOR to edit command line: emacs style
zle -N  edit-command-line
bindkey -M emacs "^X^E" edit-command-line

# Command completion
bindkey -M emacs "^N" complete-word

# Calc
autoload -U zcalc

# Exports
export TERMINAL=urxvtc
export EDITOR=vim
export BROWSER=chromium
export SBT_OPTS='-Xms512M -Xmx2G -Xss8M -XX:MaxPermSize=512M -XX:+CMSClassUnloadingEnabled'
export ANT_OPTS='-Xms2G -Xmx6G -Xss8M -XX:MaxPermSize=512M -XX:+UseParallelGC'
export GTK_USE_XFT=1
export JAVA_FONTS=/usr/share/fonts/TTF
export JREBEL_PATH=/opt/jrebel/jrebel.jar
source ~/.ec2rc
PATH=$PATH:~/.gem/ruby/1.9.1/bin

#
# Functions
#
mcd() { mkdir $1; cd $1 }


#
# Aliases
#
# Colored commands
alias grep='grep --color=auto'
alias ls='ls -F --color=auto'
# Human-readable 'df' and 'du'
alias df='df -h'
alias du='du -h'
# Run following commands without correction with autoconfirm
alias mv='nocorrect mv -i'
alias cp='nocorrect cp -iR'
alias rm='nocorrect rm -i'
alias rmf='nocorrect rm -f'
alias rmrf='nocorrect rm -fR'
alias mkdir='nocorrect mkdir'
alias vim='nocorrect vim'
alias sudo='nocorrect sudo'
# Global
alias -g H="| head"
alias -g T="| tail"
alias -g G="| grep"
alias -g L="| less"
alias -g M="| most"
# Convert to UTF-8 and back
alias -g KU="| iconv -c -f koi8r -t utf8"
alias -g CU="| iconv -c -f cp1251 -t utf8"
alias -g UK="| iconv -c -f utf8 -t koi8r"
alias -g UC="| iconv -c -f utf8 -t cp1251"
# sudo
alias sduo="sudo"
alias wifi-menu="sudo wifi-menu"
alias systemctl="sudo systemctl"
alias poweroff="sudo poweroff"
alias reboot="sudo reboot"
