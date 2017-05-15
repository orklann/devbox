# Use zsh & oh-my-zsh
#screenfetch -E

#export JAVA_HOME="/Library/Internet Plug-Ins/JavaAppletPlugin.plugin/Contents/Home"
export PATH=$HOME/bin:$PATH

alias p7="export pn=7 && ssh -4 -C -D 8088 57e37d9d0c1e6636490001c5@52.23.162.8"

### Sparkle 
export PATH="/Users/aaron/projects/Sparkle/bin:$PATH"

### mtr
export PATH="/usr/local/Cellar/mtr/0.87/sbin:$PATH"

alias tons='networksetup -setsocksfirewallproxy "Wi-Fi"  "127.0.0.1" 8088'
alias toffs="networksetup -setsocksfirewallproxystate "Wi-Fi" off"

# bored & boring & make some fun
alias cls="clear"

alias 月半小夜曲="echo by 陳樂基－原唱：李克勤"

export EDITOR="vim"

alias http_proxy="export http_proxy='http://127.0.0.1:1087'"
alias https_proxy="export https_proxy='https://127.0.0.1:1087'"
alias sock_proxy="export http_proxy=socks5://127.0.0.1:1086 https_proxy=socks5://127.0.0.1:1086"

alias dns="sudo ./dingo-darwin-amd64 -port=53"

alias ls="ls -G"

alias xx="(cd ~/XX-Net && sh start)"

# Docker & Bluemix Container
export DOCKER_HOST=tcp://containers-api.ng.bluemix.net:8443
export DOCKER_CERT_PATH=/Users/aaron/.ice/certs/containers-api.ng.bluemix.net/15cce473-6e68-4e0d-8d75-1fc6b43511ff
export DOCKER_TLS_VERIFY=1

alias reg="echo registry.ng.bluemix.net/pixelegg/[image-name]:[latest]"

eval "$(pyenv init -)"
alias todo="vim /Users/aaron/Desktop/Todo.md"

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

export GOPATH="${HOME}/go"


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
