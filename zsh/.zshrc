# ZSH BUNDLES
source $HOME/.shell/bundles

# SHELL CONFIG
source $HOME/.sensitive
source $HOME/.shell/options
source $HOME/.shell/path
source $HOME/.shell/managers
source $HOME/.shell/aliases
source $HOME/.shell/functions
source $HOME/.shell/completion

# TERMINAL THEME
BASE16_SCHEME="eighties"
BASE16_SHELL="$HOME/.config/base16-shell/base16-$BASE16_SCHEME.dark.sh"
source $BASE16_SHELL
export TERM=xterm-256color

# ------------------------------------------------------------------------------------------
# This is an adapted version of the candy theme from oh-my-zsh

function bb_git_prompt() {
    local ref=$(git_prompt_info)
    if [[ -n $ref ]]; then
        echo "  $ref"
    fi
}


PROMPT=$'%{$fg_bold[green]%}%n@%m  %{$fg[blue]%}%~%{$reset_color%}$(bb_git_prompt)\
%{$fg[blue]%}->%{$fg_bold[blue]%} %#%{$reset_color%} '
RPROMPT="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"
