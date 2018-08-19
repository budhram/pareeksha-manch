#!/bin/bash
# Credits: https://github.com/brunofacca/rails-development-environment/blob/master/vm_provisioning/bash_shortcuts.sh

shopt -s expand_aliases

# --------------- Rails commands ---------------
alias rs="rails s -b 0.0.0.0"
alias rc="rails console"

# --------------- RSpec commands ---------------
alias br="bin/rspec"
alias brfd="bin/rspec -fd"

# --------------- Rails logs ---------------
# Tail logs
alias tdl='tail -f log/development.log'
alias ttl='tail -f log/test.log'
# Clear logs
alias ctl='> log/test.log'
alias cdl='> log/development.log'

# --------------- Curl ---------------
function jcurl {
  # pretty print JSON curl output
  curl -s $* | ruby -rawesome_print -rjson -e 'ap JSON.parse(STDIN.read)'; 
}
export -f jcurl

# --------------- Bundle ---------------
function bi {
  # Run bundle install in multiple parallel threads. See http://www.mervine.net/bundle-faster
  bundle config --global jobs `nproc`
  bundle install
} 
export -f bi

# --------------- Git ---------------
alias gpl="git pull"
alias ga="git add"
# Takes a commit message as an argument
alias gc="git commit -m $1"
alias gs="git status"
# Takes a remote name and a branch name as optional arguments (e.g., origin master)
alias gp="git push $1"
