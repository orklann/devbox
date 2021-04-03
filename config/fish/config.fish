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

alias p7="export pn=7; and ssh -4 -C -D 8088 57e37d9d0c1e6636490001c5@52.23.162.8"
alias ls="ls -G"
alias xx="cd ~/XX-Net; and sh start; and cd -"
alias todo="vim $HOME/Library/Mobile\ Documents/com~apple~CloudDocs/Todo/Todo.md"
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
alias dna="sh ~/projects/colorscripts/dna.sh"

# Larger font
alias lf="echo -e \"\033]50;SetProfile=Larger Takeshi\a\" 2> /dev/null"

# Smaller font
alias sf="echo -e \"\033]50;SetProfile=Takeshi\a\" 2> /dev/null"
export LSCOLORS="exfxcxdxbxegedabagacad"

alias me="vim ~/Desktop/me.txt"

# cnpm
alias cnpm="npm --registry=https://registry.npm.taobao.org \
--cache=$HOME/.npm/.cache/cnpm \
--disturl=https://npm.taobao.org/dist \
--userconfig=$HOME/.cnpmrc"

# Jade Empire
alias jade="cd /Users/aaron/.wine/drive_c/GOG\ Games/Jade\ Empire"

# greadlink -f to print full path of file
# brew install coreutils
alias rl="greadlink -f"

export ALL_PROXY=socks5://127.0.0.1:4781

alias set_proxy="export ALL_PROXY=socks5://127.0.0.1:4781"
alias vps="ssh root@45.32.225.253 -p 22"
alias blender2901="/Applications/Blender_2.90.1.app/Contents/MacOS/Blender"
alias blender280="/Applications/Blender_2.80.app/Contents/MacOS/Blender"
alias blender281="/Applications/Blender_2.81.app/Contents/MacOS/Blender"
alias blender282="/Applications/Blender_2.82.app/Contents/MacOS/Blender"
alias blender283="/Applications/Blender_2.83.app/Contents/MacOS/Blender"
alias blender290="/Applications/Blender_2.90.app/Contents/MacOS/Blender"
alias blender291="/Applications/Blender_2.91.app/Contents/MacOS/Blender"
alias blender292="/Applications/Blender_2.92.app/Contents/MacOS/Blender"
alias addon="cd $HOME/Library/Application\ Support/Blender"

alias cloc="git ls-files | xargs cat | wc -l"