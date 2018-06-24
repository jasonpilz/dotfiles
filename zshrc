# <=============================== Zsh =====================================> #
# Path to your oh-my-zsh installation
export ZSH=/Users/"$USER"/.oh-my-zsh

# zsh-syntax-highlighting
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor root line)

# THEMES ~/.oh-my-zsh/themes/
ZSH_THEME="agnoster"
# ZSH_THEME="powerline"
# ZSH_THEME="robbyrussell"

# Hide $USER@$HOSTNAME prefix unless in ssh session
[[ -n "$SSH_CLIENT" ]] || export DEFAULT_USER=$USER

# POWERLINE
POWERLINE_RIGHT_A="exit-status"
POWERLINE_DETECT_SSH="true"
COMPLETION_WAITING_DOTS="true"

# PLUGINS may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(
  chucknorris
  git
  brew
  bundler
  docker
  docker-compose
  osx
  rake
  rails
  ruby
  zsh-autosuggestions
)

zle -N zle-line-init
source $ZSH/oh-my-zsh.sh

# <=========================== Integrations ================================> #
# iTerm2 shell integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# nvm
export NVM_DIR=~/.nvm
. $(brew --prefix nvm)/nvm.sh

# z
. `brew --prefix`/etc/profile.d/z.sh

# asdf version manager
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

# <=============================== LANGS ===================================> #
# https://github.com/golang/go/wiki/SettingGOPATH
export GOPATH=$HOME/go

# Enable history in IEx through erlang/OTP 20
export ERL_AFLAGS="-kernel shell_history enabled"


# Adjust tensorflow log level
export TF_CPP_MIN_LOG_LEVEL=2

# <=============================== PATH ====================================> #
path=(
  $path
  /Users/"$USER"/.rvm/gems/ruby-2.3.1/bin
  /Users/"$USER"/.rvm/gems/ruby-2.3.1@global/bin
  /Users/"$USER"/.rvm/rubies/ruby-2.3.1/bin
  /Users/"$USER"/.asdf/bin
  /Users/"$USER"/.asdf/shims
  /Users/"$USER"/.asdf/shims/elixir
  /Users/"$USER"/.nvm/versions/node/v5.4.1/bin
  /usr/local/bin
  /usr/local/sbin
  /usr/bin
  /bin
  /usr/sbin
  /sbin
  /usr/local/MacGPG2/bin
  /Users/"$USER"/.rvm/bin
  /Users/"$USER"/.mix/escripts
  /Users/"$USER"/scripts
  /Users/"$USER"/.asdf/installs/elixir/1.4.0/.mix/escripts
  /Users/"$USER"/.asdf/installs/elixir/1.5.0/.mix/escripts
  /Users/"$USER"/.ngrok
  $(go env GOPATH)/bin
  /Users/"$USER"/anaconda3/bin
)

export PATH

# <============================ Functions ==================================> #
# pretty print and colorize curl request
function jcurl() {
    curl "$@" | json | pygmentize -l json
}

function pbcurl() {
    curl "$@" | json | pbcopy
}

# List folder contents after cd
function chpwd() {
    ls -lah
}

# https://gist.github.com/moklett/3170636
function hfavpn() {
    host=${2:-'https://vpn.harryfox.com'}
    group=${3:-'HFAVPN'}
    user=${4:-'jpilz'}
    echo "$1" | \
    sudo openconnect \
         --user="$user" \
         --passwd-on-stdin \
         --authgroup="$group" \
         "$host"
}

# ALIASES For a full list of active aliases, run `alias`
[[ -f ~/.aliases  ]] && source ~/.aliases

# <============================ Exports ====================================> #
# for HFA cloudsearch script
# export AWS_REGION=us-east-1
