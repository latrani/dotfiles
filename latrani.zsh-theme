# Based on gnzh theme

setopt prompt_subst

() {

local PR_USER PR_USER_OP PR_PROMPT PR_HOST

# Check the UID
if [[ $UID -ne 0 ]]; then # normal user
  PR_USER='%F{magenta}%n%f'
  PR_USER_OP='%F{magenta}%#%f'
  PR_PROMPT='%F{cyan}➤ %f'
else # root
  PR_USER='%F{red}%n%f'
  PR_USER_OP='%F{red}%#%f'
  PR_PROMPT='%F{red}➤ %f'
fi

# Check if we are on SSH or not
# if [[ -n "$SSH_CLIENT"  ||  -n "$SSH2_CLIENT" ]]; then
#   PR_HOST='%F{red}%M%f' # SSH
# else
#   PR_HOST='%F{green}%M%f' # no SSH
# fi

PR_HOST='%F{magenta}%M%f' # no SSH

local return_code="%(?..%F{red}%? ↵%f)"

local user_host="${PR_USER}%F{blue}@${PR_HOST}"
local current_dir="%B%F{cyan}%~%f%b"
local rvm_ruby=''
if ${HOME}/.rvm/bin/rvm-prompt &> /dev/null; then # detect user-local rvm installation
  rvm_ruby='%F{red}‹$(${HOME}/.rvm/bin/rvm-prompt i v g s)›%f'
elif which rvm-prompt &> /dev/null; then # detect system-wide rvm installation
  rvm_ruby='%F{red}‹$(rvm-prompt i v g s)›%f'
elif which rbenv &> /dev/null; then # detect Simple Ruby Version Management
  rvm_ruby='%F{red}‹$(rbenv version | sed -e "s/ (set.*$//")›%f'
fi
local git_branch='$(git_prompt_info)'

PROMPT="%F{blue}╭─${user_host} ${current_dir} ${rvm_ruby} ${git_branch}
%F{blue}╰─$PR_PROMPT"
RPROMPT="${return_code}"

ZSH_THEME_GIT_PROMPT_PREFIX="%F{green}‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="› %f"

}
