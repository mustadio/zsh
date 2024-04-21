source ~/.config/zsh/zsh-autocomplete/zsh-autocomplete.plugin.zsh

skip_global_compinit=1

HISTFILE="$HOME/.zsh_history"
HISTSIZE=100000
SAVEHIST=100000

setopt APPEND_HISTORY


autoload -Uz vcs_info
precmd() { vcs_info }

zstyle ':vcs_info:git:*' formats '%b '

if [[ $HOST == "Chester-Desktop" ]]
then
  SHORTHOST="MyPC"
elif [[ $HOST == "chestsh-server" ]]
then
  SHORTHOST="GateWay"
else
  SHORTHOST=%m
fi

setopt PROMPT_SUBST
PROMPT='$SHORTHOST %F{blue}%2~%f %F{magenta}${vcs_info_msg_0_}%f$ '


