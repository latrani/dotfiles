# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="latrani"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
if [[ -n $SSH_CONNECTION ]]; then
  plugins=(git)
else
  plugins=(git brew osx)
fi

source $ZSH/oh-my-zsh.sh

# User configuration

export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

export EDITOR='vim'

export PATH=$HOME/.bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH

eval `dircolors -b ~/.dircolors`
# Sticking this here makes dir completion come out in the colors set above.
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias cl="clear"

alias ack='ack --pager="less -R"'
alias ag="ag --pager less"
alias emacs="emacs -nw"
alias ls='ls --color=tty --quoting-style=shell'

test -e ${HOME}/.iterm2_shell_integration.zsh && source ${HOME}/.iterm2_shell_integration.zsh

if [[ -n $SSH_CONNECTION ]]; then
  ## Liunx-only stuff
  bindkey "^[[1;3C" forward-word
  bindkey "^[[1;3D" backward-word
else
  ## Mac-only stuff
  alias eclipse-sync="ssh -N -L 8385:localhost:8384 eclipse & sleep 1 ; open http://localhost:8385"
  alias muck="mosh eclipse -- tmux attach"
fi
