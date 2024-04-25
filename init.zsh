source ~/.config/zsh/zsh-autocomplete/zsh-autocomplete.plugin.zsh

skip_global_compinit=1

HISTFILE="$HOME/.zsh_history"
HISTSIZE=100000
SAVEHIST=100000

setopt APPEND_HISTORY


autoload -Uz vcs_info
precmd() { vcs_info }

zstyle ':vcs_info:git:*' formats "%F{magenta}%c%u(%b)%f on %F{cyan}%r%f "
zstyle ':vcs_info:*' actionformats " %F{magenta}%c%u(%b)%f %a on %F{cyan}%r%f "
zstyle ':vcs_info:*' stagedstr "%F{green}"
zstyle ':vcs_info:*' unstagedstr "%F{red}"
zstyle ':vcs_info:*' check-for-changes true

bindkey -M menuselect  '^[[D' .backward-char  '^[OD' .backward-char
bindkey -M menuselect  '^[[C'  .forward-char  '^[OC'  .forward-char

#if [[ $HOST == "Chester-Desktop" ]]
#then
#  SHORTHOST="MyPC"
#elif [[ $HOST == "chestsh-server" ]]
#then
#  SHORTHOST="GateWay"
#else
#  SHORTHOST=%m
#fi

SHORTHOST=%m
case $HOST {
    ( "Chester-Desktop" ) SHORTHOST="MyPC" ;;
    ( "chestsh-server" ) SHORTHOST="GateWay" ;;
    ( "LAPTOP-chestsh") SHORTHOST="MyLaptop" ;;
}


setopt PROMPT_SUBST
PROMPT='$SHORTHOST %F{blue}%2~%f ${vcs_info_msg_0_}$ '


