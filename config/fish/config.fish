# Path to your oh-my-fish.
set fish_path $HOME/.oh-my-fish

# Path to your custom folder (default path is ~/.oh-my-fish/custom)
#set fish_custom $HOME/dotfiles/oh-my-fish

# Load oh-my-fish configuration.
. $fish_path/oh-my-fish.fish

# Source ~/.profile
fenv source ~/.profile

# Don't show startup message
set --universal fish_greeting

# Aliases
alias :q=exit
alias :wq=exit
alias :e=vim
alias gs="git status"
alias gc="git commit -m"
alias ga="git add"
alias gd="git diff"
alias gp="git push"
alias gl='git log --pretty=format:"%s"'

export HTTP_PROXY=socks5://127.0.0.1:4781
export HTTPS_PROXY=socks5://127.0.0.1:4781

alias set_proxy="export ALL_PROXY=socks5://127.0.0.1:4781"
alias vps="ssh root@45.32.225.253 -p 22"
alias addon="cd $HOME/Library/Application\ Support/Blender"

alias cloc="git ls-files | xargs cat | wc -l"
