# Path to your oh-my-fish.
set fish_path $HOME/.oh-my-fish

# Path to your custom folder (default path is ~/.oh-my-fish/custom)
#set fish_custom $HOME/dotfiles/oh-my-fish

# Load oh-my-fish configuration.
. $fish_path/oh-my-fish.fish

# Source ~/.profile
fenv source ~/.profile

# Aliases
alias :q=exit
alias :wq=exit
alias :e=vim
alias gs="git status"
alias gc="git commit -m"
alias gl="git lg"
alias ga="git add"
alias gd="git diff"
alias gp="git push"

alias p7="export pn=7; and ssh -4 -C -D 8088 57e37d9d0c1e6636490001c5@52.23.162.8"
alias http_proxy="export http_proxy='http://127.0.0.1:1087'"
alias https_proxy="export https_proxy='https://127.0.0.1:1087'"
alias ls="ls -G"
alias xx="cd ~/XX-Net; and sh start; and cd -"
alias todo="vim /Users/aaron/Desktop/Todo.md"
alias pfon="sudo pfctl -f /Users/aaron/go/tapestry/ipfw.rules"
alias pfoff="sudo pfctl -f /etc/pf.conf"
alias pfst="sudo pfctl -s nat"
alias gae="dev_appserver.py app.yaml"
alias l="resize -s 45 120 2>&1 > /dev/null"
alias s="resize -s 45 80 2>&1 > /dev/null"
alias gae_dep="gcloud app deploy --project electric-abode-166904"

alias tape="vim /Users/aaron/Desktop/Tapestry.md"
alias reload="source ~/.profile"
alias profile="vim ~/.profile"

alias d="sudo ./TapestryD"
alias n="sudo -u nobody ./TapestryNetworking"
alias tapestry="cd $GOPATH/tapestry"

export LSCOLORS="exfxcxdxbxegedabagacad"
#set -g __fish_git_prompt_char_dirtystate '+'
