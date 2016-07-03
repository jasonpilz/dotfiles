# Path to your oh-my-zsh installation.
export ZSH=/Users/"$USER"/.oh-my-zsh

# Load zsh-syntax-highlighting
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor root line)

# Look in ~/.oh-my-zsh/themes/
ZSH_THEME="agnoster"
# ZSH_THEME="powerline"
# ZSH_THEME="robbyrussell"

# Hide $USER@$HOSTNAME prefix unless in ssh session
[[ -n "$SSH_CLIENT" ]] || export DEFAULT_USER=$USER

# Configure powerline
POWERLINE_RIGHT_A="exit-status"
POWERLINE_DETECT_SSH="true"

# Config for NVM
export NVM_DIR=~/.nvm
. $(brew --prefix nvm)/nvm.sh

# pretty print and colorize curl request
function jcurl() {
    curl "$1" | json | pygmentize -l json
}

# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(git rails ruby zsh-autosuggestions)

#User configuration
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PATH="/Users/"$USER"/.gem/ruby/2.2.2/bin:/Users/"$USER"/.rubies/ruby-2.2.2/lib/ruby/gems/2.2.0/bin:/Users/"$USER"/.rubies/ruby-2.2.2/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

source $ZSH/oh-my-zsh.sh

zle -N zle-line-init

# List folder contents after cd
function chpwd() {
    ls -lah
}

# Config for lunchy gem
# LUNCHY_DIR=$(dirname `gem which lunchy`)/../extras
# if [ -f $LUNCHY_DIR/lunchy-completion.zsh  ]; then
#   . $LUNCHY_DIR/lunchy-completion.zsh
# fi

# aliases
# For a full list of active aliases, run `alias`.
[[ -f ~/.aliases  ]] && source ~/.aliases

COMPLETION_WAITING_DOTS="true"
