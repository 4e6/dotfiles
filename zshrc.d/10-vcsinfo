### Example output: [master↑1✚]±
### ↑n - number of branches ahead
### ↓n - number of branches behind
### •  - staged files
### ✚  - unstaged files
### …  - untracked files
# http://zsh.git.sourceforge.net/git/gitweb.cgi?p=zsh/zsh;a=blob;f=Misc/vcs_info-examples

#default_prompt_char='%#'
#setopt prompt_subst
#PROMPT='%F{cyan}%c%f %F{green}${vcs_info_msg_0_}%f%F{grey}$(vcs_prompt_symbol $default_prompt_char)%f '
#RPROMPT='%F{grey}%~/%f %(?.%F{green}:%)%f.%F{red}:(%f)'


### Display the existence of files not yet known to VCS
### git: Show marker (T) if there are untracked files in repository
# Make sure you have added staged to your 'formats':  %c

function +vi-git-untracked() {
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

# Detects the VCS and shows the appropriate sign
vcs_prompt_symbol () {
  which git &> /dev/null && git branch &> /dev/null && echo '±' && return
  which hg &> /dev/null && hg root &> /dev/null && echo '☿' && return
  which svn &> /dev/null && svn info &> /dev/null && echo '⚡' && return
  echo $1 #fallback symbol
}

prompt_vcs_info_setup () {
  autoload -Uz vcs_info add-zsh-hook

  zstyle ':vcs_info:*+*:*' debug false
  zstyle ':vcs_info:*' stagedstr '%F{green}•%f'
  zstyle ':vcs_info:*' unstagedstr '%F{yellow}✚%f'
  zstyle ':vcs_info:*' check-for-changes true
  zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{red}:%f%F{yellow}%r%f'
  zstyle ':vcs_info:*' enable git svn
  zstyle ':vcs_info:git*+set-message:*' hooks git-untracked git-st
  zstyle ':vcs_info:*' formats '%F{black}[%f%F{blue}%b%f%F{grey}%m%f%c%u%F{black}]%f'

  add-zsh-hook precmd vcs_info
}

prompt_vcs_info_setup
