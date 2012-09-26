# Ramen theme - Based on Dark Blood and the old-school zsh elite prompts

function virtualenv_prompt_info {
    if [ $VIRTUAL_ENV ]; then
        echo "$ZSH_THEME_VIRTUALENV_PROMPT_PREFIX$(basename $VIRTUAL_ENV)$ZSH_THEME_VIRTUALENV_PROMPT_SUFFIX"
    fi
}

function prompt_char {
    git branch >/dev/null 2>/dev/null && echo '±' && return
    hg root >/dev/null 2>/dev/null && echo '☿' && return
    echo '○'
}

function battery_meter {
  if [[ -f ~/Dropbox/Scripts/bat_charge.py ]]; then
    echo -n "%{$fg[magenta]%}-%{$reset_color%}%{$fg[blue]%}[";
    echo -n `~/Dropbox/Scripts/bat_charge.py` 2>/dev/null;
    echo "%{$fg[blue]%}]";
  fi
}


PROMPT=$'%{$fg[magenta]%}┌%{$reset_color%}%{$fg[blue]%}[%{$fg[cyan]%}%n@%m%{$reset_color%}%{$fg[blue]%}]%{$fg[magenta]%}-%{$reset_color%}%{$fg[blue]%}[%{$fg[cyan]%}%D{%H:%M} %D{%m/%d/%y}%{$reset_color%}%{$fg[blue]%}]%{$(git_prompt_info)%}%{$(virtualenv_prompt_info)%}
%{$fg[magenta]%}└%{$reset_color%}%{$fg[blue]%}[%{$fg[cyan]%}$(prompt_char)%{$fg[magenta]%}:%{$fg[cyan]%}%40<⋮<${PWD/#$HOME/~}%{$reset_color%}%{$fg[blue]%}]%{$fg[magenta]%}>%{$reset_color%} '
PS2=$' %{$fg[blue]%}|%{$fg[magenta]%}>%{$reset_color%} '

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[magenta]%}-%{$reset_color%}%{$fg[blue]%}[%{$fg[cyan]%}git%{$fg[magenta]%}:%{$fg[cyan]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}%{$fg[blue]%}]"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[magenta]%}*%{$reset_color%}"

ZSH_THEME_VIRTUALENV_PROMPT_PREFIX="%{$fg[magenta]%}-%{$reset_color%}%{$fg[blue]%}[%{$fg[cyan]%}env%{$fg[magenta]%}:%{$fg[cyan]%}"
ZSH_THEME_VIRTUALENV_PROMPT_SUFFIX="%{$reset_color%}%{$fg[blue]%}]"
