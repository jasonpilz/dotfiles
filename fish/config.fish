# various paths
set --export PATH $HOME/bin               \
                  $HOME/code/dotfiles/bin \
                  /usr/local/bin          \
                  $PATH

# Rails cucumber integration looks for this env var to decide how to display output
set --export CUCUMBER_FORMAT pretty

# Set ENV variables

# AWS
set --export AWS_ACCESS_KEY_ID AKIAJ7VWVX6Z34BRSVEA
set --export AWS_SECRET_ACCESS_KEY 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
# Sparkfun data stream - 80022 Temp
set --export SF_TEMP_PUBLIC_KEY lz569A9rojuOY5ERb9Lj
set --export SF_TEMP_PRIVATE_KEY Elwp8q8anXCer2nalJ4x

# Custom kill and foreground commands since I work with a lot of background jobs
for i in (seq 30)
  eval "function $i
          fg %$i
        end"
end

# Load ruby. Interface is less helpful than rbenv
# but Brixen says it works with rbx in ways that rbenv's assumptions won't let it
source /usr/local/share/chruby/chruby.fish
chruby 2.2.2

# Don't print a greeting when I start the shell
set --erase fish_greeting

# For configs that I don't want in my public git (ie work stuff and stuff that changes across computers)
if test -e ~/.config/fish/private_config.fish
  source   ~/.config/fish/private_config.fish
end

# Have `tree` colour directories yellowish
# this shit is so badly documented and inconsistent
set --export LS_COLORS 'di=36'

# To enable the Postgres.app command line tools...
set PATH /Applications/Postgres.app/Contents/Versions/9.4/bin $PATH

# Alias

alias aa="atom ."
alias DO="ssh root@104.236.102.65"
alias gg="git log --oneline --abbrev-commit --all --graph --decorate --color"
alias gcm="git commit -m"
alias ll="ls -lah"
alias tc="time cat"
alias code="cd ~/code"
alias rt="rake test"
alias rr="rake routes"
alias yolo="rake db:drop db:create db:migrate db:seed"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
