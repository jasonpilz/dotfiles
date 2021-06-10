# <=============================== Zsh =====================================> #
# Path to your oh-my-zsh installation
export ZSH=/Users/"$USER"/.oh-my-zsh
export ZSH_DISABLE_COMPFIX=true

# zsh-syntax-highlighting
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor root line)

# Hide $USER@$HOSTNAME prefix unless in ssh session
[[ -n "$SSH_CLIENT" ]] || export DEFAULT_USER=$USER

COMPLETION_WAITING_DOTS="true"

# PLUGINS may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(
  aws
  asdf
  chucknorris
  git
  golang
  brew
  bundler
  docker
  docker-compose
  mix
  osx
  rake
  ruby
  terraform
  web-search
  zsh-autosuggestions
)

# powerline-go
function powerline_precmd() {
    eval "$(
      ~/go/bin/powerline-go \
      -error $? \
      -shell zsh \
      -modules venv,user,cwd,perms,ssh,dotenv,git,jobs,exit,terraform-workspace \
      -eval \
      -modules-right docker,aws \
      -path-aliases \~/code=@CODE \
      -numeric-exit-codes \
    )"
}

function install_powerline_precmd() {
  for s in "${precmd_functions[@]}"; do
    if [ "$s" = "powerline_precmd" ]; then
      return
    fi
  done
  precmd_functions+=(powerline_precmd)
}

if [ "$TERM" != "linux" ]; then
    install_powerline_precmd
fi

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

# <=============================== Langs ===================================> #
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
    curl "$@" | jq . | pygmentize -l json
}

function pbcurl() {
    curl "$@" | json | pbcopy
}

# List folder contents after cd
function chpwd() {
    ls -lah
}

# Login to AWS ECR
function ecr-login {
  local REGION=$(aws configure get region)
  local ID=$(aws sts get-caller-identity --query Account --output text)

  printf "Logging in to ECR... "

  if curl --connect-timeout 2 -o /dev/null -s https://ecr.${REGION}.amazonaws.com/; then
    aws ecr get-login-password | docker login --username AWS --password-stdin ${ID}.dkr.ecr.${REGION}.amazonaws.com
  else
    echo "Unable to establish contact with amazonaws.com, continuing unauthenticated"
  fi
}

# <============================ Aliases ====================================> #
# For a full list of active aliases, run `alias`
[[ -f ~/.aliases  ]] && source ~/.aliases

# <============================ Sesac ======================================> #
# https://gist.github.com/moklett/3170636
function sesacvpn() {
    host=${2:-'https://vpn.sesac.com'}
    group=${3:-'HFAVPN'}
    user=${4:-'jpilz'}
    echo "$1" | \
    sudo openconnect \
         --user="$user" \
         --passwd-on-stdin \
         --authgroup="$group" \
         "$host"
}

# <============================ Exports ====================================> #
export AWS_PROFILE=
export GOPRIVATE=github.com/jasonpilz
