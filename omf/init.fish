source $OMF_CONFIG/prompt.fish

export MANPATH="/usr/local/man:$MANPATH"

set -gx PATH $HOME/.bin $PATH

export EDITOR='vim'

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias cl="clear"
alias ack='ack --pager="less -R"'
alias ag="ag --pager less"
alias emacs="emacs -nw"

switch (uname)
  case Darwin
    test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish
    alias eclipse-sync="ssh -N -L 8385:localhost:8384 eclipse & sleep 1 ; open http://localhost:8385"
    alias muck="mosh eclipse -- tmux attach"
end