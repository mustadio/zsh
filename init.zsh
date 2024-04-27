source ~/.config/zsh/zsh-autocomplete/zsh-autocomplete.plugin.zsh

skip_global_compinit=1

HISTFILE="$HOME/.zsh_history"
HISTSIZE=100000
SAVEHIST=100000

#autoload colors; colors;
#export LSCOLORS="Gxfxcxdxbxegedabagacad"
setopt PROMPT_SUBST
setopt APPEND_HISTORY


alias ls="ls --color=auto"

ZSH_THEME_GIT_PROMPT_PREFIX="%f%F{cyan}["
ZSH_THEME_GIT_PROMPT_SUFFIX="]%f"
ZSH_THEME_GIT_PROMPT_DIRTY="%F{red}*%f"
ZSH_THEME_GIT_PROMPT_CLEAN=""

# show git branch/tag, or name-rev if on detached head
parse_git_branch() {
  command git symbolic-ref -q HEAD 2>/dev/null
}

parse_git_commit() {
  command git rev-parse --short HEAD 2>/dev/null
}

parse_git_dirty() {
  if command git diff-index --quiet HEAD 2> /dev/null; then
    echo "$ZSH_THEME_GIT_PROMPT_CLEAN"
  else
    echo "$ZSH_THEME_GIT_PROMPT_DIRTY"
  fi
}

# if in a git repo, show dirty indicator + git branch
git_custom_status() {
  local git_branch="$(parse_git_branch)"
  local git_commit="$(parse_git_commit)"
  if [[ -n "$git_branch" ]]; then
    echo "$(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_PREFIX${git_branch#(refs/heads/|tags/)}$ZSH_THEME_GIT_PROMPT_SUFFIX"
  elif [[ -n "$git_commit" ]]; then
    echo "$(parse_git_dirty)%F{yellow}detached%f at $ZSH_THEME_GIT_PROMPT_PREFIX${git_commit}$ZSH_THEME_GIT_PROMPT_SUFFIX"
  fi
}

bindkey -M menuselect  '^[[D' .backward-char  '^[OD' .backward-char
bindkey -M menuselect  '^[[C'  .forward-char  '^[OC'  .forward-char


SHORTHOST=%m
case $HOST {
    ( "Chester-Desktop" ) SHORTHOST="MyPC" ;;
    ( "chestsh-server" ) SHORTHOST="GateWay" ;;
    ( "LAPTOP-chestsh") SHORTHOST="MyLaptop" ;;
}


RPS1='$(git_custom_status) $EPS1'

PROMPT='%F{green}%n%f@%F{magenta}$SHORTHOST%f %F{blue}%2~%f $ '


