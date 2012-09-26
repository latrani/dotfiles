# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="latrani"

# Set to this to use case-sensitive completion
CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git osx brew pip)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=~/.bin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/X11/bin:
export PATH=$PATH:/Library/Frameworks/Python.framework/Versions/Current/bin:Library/Ruby/Gems/1.8/bin
export PATH=$PATH:~/.phabricator/arcanist/bin
export EDITOR="subl -w"
export VISUAL="subl -w"
export VIRTUAL_ENV_DISABLE_PROMPT=true

source $ZSH/oh-my-zsh.sh

bindkey "^[[1~" beginning-of-line # Home
bindkey "^[[4~" end-of-line # End
bindkey "^[[3~" delete-char # Delete
bindkey "^[[2~" overwrite-mode # Insert
bindkey "^[[5~" history-beginning-search-backward # Page Up
bindkey "^[[6~" history-beginning-search-forward # Page Down

bindkey "^B"  backward-word # One word back
bindkey "^N"  forward-word # One word forward
bindkey "^[OD" backward-word
bindkey "^[OC" forward-word

eval `dircolors -b ~/.dircolors`
# Sticking this here makes dir completion come out in the colors set above.
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias cl="clear"

alias br='open -a "Path Finder"'
alias app='open -a'
alias vim='mvim'
alias ack='ack --pager="less -R"'
# alias mate='mvim'

function rzsh {
  source ~/.zshrc
}

function we() {
  cd ~/Projects/wepwawet/wepwawet/wepwawet
  subl .
}

function wa() {
  source ~/Projects/wepwawet/bin/activate
  cd ~/Projects/wepwawet/wepwawet
}

function ce() {
  cd ~/Projects/canopyc/canopyc/
  subl .
}

function ca() {
  source ~/Projects/canopyc/bin/activate
  cd ~/Projects/canopyc/canopyc
}

function cs() {
  ca
  pserve development.ini --reload
}
