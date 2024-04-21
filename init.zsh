source ~/.config/zsh/zsh-autocomplete/zsh-autocomplete.plugin.zsh

skip_global_compinit=1


autoload -Uz vcs_info
precmd() { vcs_info }

zstyle ':vcs_info:git:*' formats '%b '

setopt PROMPT_SUBST
PROMPT='%F{green}%*%f %F{cyan}%m%f %F{blue}%1~%f %F{magenta}${vcs_info_msg_0_}%f$ '
