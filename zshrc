# Path to your oh-my-zsh installation.
export ZSH=/Users/Jason/.oh-my-zsh

# Load zsh-syntax-highlighting
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor root line)

# Look in ~/.oh-my-zsh/themes/
ZSH_THEME="agnoster"
# ZSH_THEME="powerline"
# ZSH_THEME="robbyrussell"

# Hide $USER@$HOSTNAME prefix unless in ssh session
[[ -n "$SSH_CLIENT" ]] || export DEFAULT_USER="Jason"

# Configure powerline
POWERLINE_RIGHT_A="exit-status"
POWERLINE_DETECT_SSH="true"

# List folder contents after cd
function chpwd() {
    ls -lah
}

# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(git rails ruby)

# User configuration
export PATH="/Users/Jason/.gem/ruby/2.2.2/bin:/Users/Jason/.rubies/ruby-2.2.2/lib/ruby/gems/2.2.0/bin:/Users/Jason/.rubies/ruby-2.2.2/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
source $ZSH/oh-my-zsh.sh

# Load zsh-autosuggestions
source ~/.zsh/zsh-autosuggestions/autosuggestions.zsh

# Enable autosuggestions automatically
zle-line-init() {
    zle autosuggest-start
}
zle -N zle-line-init

# For a full list of active aliases, run `alias`.
alias   zc="vim ~/.zshrc"
alias   gs="git status"
alias   ll="ls -lah"
alias   lon="particle function call sephiroth led on"
alias   loff="particle function call sephiroth led off"
alias   voltage="particle variable get sephiroth voltage"

COMPLETION_WAITING_DOTS="true"
