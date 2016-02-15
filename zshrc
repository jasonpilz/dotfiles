# Path to your oh-my-zsh installation.
export ZSH=/Users/Jason/.oh-my-zsh

# Look in ~/.oh-my-zsh/themes/
# ZSH_THEME="powerline"
ZSH_THEME="agnoster"
# ZSH_THEME="robbyrussell"

# Hide $USER@$HOSTNAME prefix unless in ssh session
# export DEFAULT_USER="Jason"
[[ -n "$SSH_CLIENT" ]] || export DEFAULT_USER="Jason"

# Configure powerline
POWERLINE_RIGHT_A="exit-status"

POWERLINE_DETECT_SSH="true"

# List folder contents after cd
function chpwd() {
    emulate -L zsh
    ls -lah
}

# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(git rails ruby)

# User configuration
export PATH="/Users/Jason/.gem/ruby/2.2.2/bin:/Users/Jason/.rubies/ruby-2.2.2/lib/ruby/gems/2.2.0/bin:/Users/Jason/.rubies/ruby-2.2.2/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
source $ZSH/oh-my-zsh.sh

# Load zsh-syntax-highlighting
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor root line)

# Load zsh-autosuggestions
source ~/.zsh/zsh-autosuggestions/autosuggestions.zsh

# Enable autosuggestions automatically
zle-line-init() {
    zle autosuggest-start
}
zle -N zle-line-init

# For a full list of active aliases, run `alias`.
alias zshconfig="vim ~/.zshrc"
alias        gs="git status"
alias        ll="ls -lah"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

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

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"
