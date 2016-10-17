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
    curl "$@" | json | pygmentize -l json
}

# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(git rails ruby chucknorris zsh-autosuggestions docker)

#User configuration
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PATH="/Users/"$USER"/.gem/ruby/2.3.0/bin:/Users/"$USER"/.rubies/ruby-2.3.0/lib/ruby/gems/2.3.0/bin:/Users/"$USER"/.rubies/ruby-2.3.0/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

source $ZSH/oh-my-zsh.sh

# Load z
. `brew --prefix`/etc/profile.d/z.sh

zle -N zle-line-init

# List folder contents after cd
function chpwd() {
    ls -lah
}

# Use openconnect to connect to the Sesac VPN
# https://gist.github.com/moklett/3170636
function sesacvpn() {
    echo "$1" | \
    sudo openconnect \
         --user=jpilz \
         --passwd-on-stdin \
         --authgroup=EMP-Access \
         --no-cert-check \
         vpn.sesac.com
}

# aliases
# For a full list of active aliases, run `alias`.
[[ -f ~/.aliases  ]] && source ~/.aliases

COMPLETION_WAITING_DOTS="true"
export PATH="/usr/local/sbin:$PATH"

# iTerm2 Shell integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# asdf version manager
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash
