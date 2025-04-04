# change terminal UTF to UTF-8
export LC_ALL=en_US.UTF-8

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/rgomes/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
  aliases
  autojump
  aws
  brew
  docker
  docker-compose
  eza
  fzf
  fnm
  flutter
  git
  github
  gitfast
  helm
  history  
  httpie
  jump
  k9s
  # fastlane
  kubectl
  kube-ps1
  minikube
  npm
  nvm
  pip
  poetry
  pyenv
  python
  podman
  terraform
  themes
  thefuck
  rbenv
  ruby
  vagrant  
  vscode
  z 
)

source $ZSH/oh-my-zsh.sh

# Unaliasing
unalias gk

export REQUESTS_CA_BUNDLE=/Library/Certificates/allcerts.pem

alias cl="clear"
alias c="code"
alias nv="nvim"

alias gos="ghostty"

alias zl="zellij"

# FZF
eval "$(fzf --zsh)"
export FZF_DEFAULT_OPTS="--ansi --preview-window 'right:60%' --preview 'bat --color=always --style=header,grid --line-range :300 {}'"
export FZF_DEFAULT_COMMAND='fd --hidden --strip-cwd-prefix --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

_fzf_compgen_path() {
  fd --hidden --follow --exclude .git . "$1"
}

_fzf_compgen_path_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}

# source $HOME/projects/plugins/fzf-git.sh/fzf-git.sh

# Lazygit
alias lg='lazygit'

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nano'
else
  export EDITOR='code'
fi
export EDITOR='nano'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PYENV_ROOT/shims:$PATH"
export PIPENV_PYTHON="$PYENV_ROOT/shims/python"

plugin=(
  pyenv
)

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

WEBSTORM=/Applications/WebStorm.app/Contents/MacOS
export PATH=$PATH:$WEBSTORM
alias ws="webstorm"

# Example aliases

alias brew='env PATH="${PATH//$(pyenv root)\/shims:/}" brew'

alias zshedit="code ~/.zshrc"
alias ohmyzsh="code ~/.oh-my-zsh"
alias zshsource="source ~/.zshrc"

alias dckrmid="docker images | grep none | awk '{ print $3; }' | xargs docker rmi"
alias dckrmc="docker ps -aq | xargs docker rm -v"
export COMPOSE_IGNORE_ORPHANS=1
export LIMA_INSTANCE=docker

alias ctl="corectl"
alias ctld="corectl azureAD aws --app identity --account dev --role DevAdmin"
alias ctls="corectl azureAD aws --app identity --account stg --role ReadOnly"
alias ctlp="corectl azureAD aws --app identity --account prd --role ReadOnly"
alias ctla="corectl cf aws"
alias ctlvt="corectl vault token"
alias bgp="corectl aad aws --account prd --app 'AWS (Identity) - BreakGlass' --role 'PlatformBreakGlass' && aws eks update-kubeconfig --name=tap"
alias bgd="corectl aad aws --account dev --app 'AWS (Identity) - BreakGlass' --role 'PlatformBreakGlass' && aws eks update-kubeconfig --name=tap"
alias bgs="corectl aad aws --account stg --app 'AWS (Identity) - BreakGlass' --role 'PlatformBreakGlass' && aws eks update-kubeconfig --name=tap"

alias dbbg="corectl breakglass -n platform --endpoints 'connect-cluster-feast.cluster-c8wyxt0a6yk9.ap-southeast-2.rds.amazonaws.com:5432' --deployment food-ordering-core --vaultPath '/database/creds/connect-connect-cluster-feast-connect-break-glass' --force"

# Git aliases
alias gmm="git merge master"
alias ghd="git deploy"

alias f="flutter"

alias awsl="awslocal"

# alias watch="watch "
alias v="vagrant "

# K8S
export PATH=$PATH:$HOME/.rd/bin/kubectl
alias mk="minikube"
alias kctx="kubectx"
alias k="kubectl"
alias kl="kubectl logs"
export do="-o yaml --dry-run='client'" # k create deploy nginx --image=nginx $do
export labels="--show-labels=true"    
export now="--force --grace-period 0" # k delete pod x $now
export nh='--no-headers'
alias kw='watch kubectl '

function kjump() {
  POD_NAME="$1"
  kubectl exec -n platform -it $POD_NAME -- /bin/sh
}

# personal bin folder
export PATH="$HOME/bin:$PATH"

export ns=defau
# alias k='kubectl -n $ns' # This helps when namespace in question doesn't have a friendly name 
# alias kdr='kubectl -n $ns -o yaml --dry-run '.  # run commands in dry run mode and generate yaml.

# Podman
alias pdm="podman"

# GOLANG
# export GOPATH="$HOME/.gobrew/current/go"
# export GOROOT="$HOME/.gobrew/versions/1.22.4/go"
# export GOBIN="$HOME/bin"
# export PATH="$PATH:$GOPATH/bin"
# export PATH="$HOME/.gobrew/current/bin:$HOME/.gobrew/bin:$PATH"
# export PATH="$GOROOT:$PATH"

# export GOPATH=$HOME/Projects/go
# export PATH=$PATH:/opt/homebrew/bin/go

# Git
export GITSTATUS_LOG_LEVEL=DEBUG

# Load rbenv automatically by appending
# the following to ~/.zshrc:
# if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
eval "$(/opt/homebrew/bin/rbenv init - zsh)"

# NVM Stuff
export NVM_DIR="/opt/homebrew/opt/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/etc/bash_completion.d/nvm" ] && \. "$NVM_DIR/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# pnpm
alias pn="pnpm"
export PNPM_HOME="/Users/rgomes/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# remove this when not working on React Native
export NODE_OPTIONS=--openssl-legacy-provider
export NODE_TLS_REJECT_UNAUTHORIZED=0
export NODE_EXTRA_CA_CERTS=/Library/Certificates/allcerts.pem

# Ruby
export PATH=$PATH:$HOME/.gem/bin

#To activate these completions, add the following to your .zshrc:
fpath=(/usr/local/share/zsh-completions $fpath)

#You may also need to force rebuild `zcompdump`:
rm -f ~/.zcompdump; compinit

#Additionally, if you receive "zsh compinit: insecure directories" warnings when attempting
#to load these completions, you may need to run this:
# chmod go-w '/usr/local/share'


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/usr/local/bin/google-cloud-sdk/path.zsh.inc' ]; then . '/usr/local/bin/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/usr/local/bin/google-cloud-sdk/completion.zsh.inc' ]; then . '/usr/local/bin/google-cloud-sdk/completion.zsh.inc'; fi

source ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# zprof
# source /usr/local/etc/zsh_common/.zsh_aliases
# source /usr/local/etc/zsh_common/.env

# Java
export PATH="$HOME/.jenv/bin:$PATH"
if command -v jenv 1>/dev/null 2>&1; then
  eval "$(jenv init -)"
fi

# kube krew - plugins
export PATH="${PATH}:${HOME}/.krew/bin"

export PATH=$HOME/Projects/personal/shell-scripts:$PATH

eval "$(/opt/homebrew/bin/brew shellenv)"

export PATH="/usr/local/opt/libpq/bin:$PATH"
# bun completions
# [ -s "/Users/rgomes/.bun/_bun" ] && source "/Users/rgomes/.bun/_bun"

# bun
# export BUN_INSTALL="/Users/rgomes/.bun"
# export PATH="$BUN_INSTALL/bin:$PATH"

export DOTNET_ROOT="/opt/homebrew/opt/dotnet/libexec"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

#react-native: android
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$HOME/Library/Android/sdk/cmdline-tools/10.0/bin

# lua
# if which luaver > /dev/null; then . `which luaver`; fi

# Rust
export PQ_LIB_DIR="$(brew --prefix libpq)/lib"
export PATH=$PATH:$HOME/.cargo/binexport 

# maestro
export PATH="$PATH":"$HOME/.maestro/bin"

source $HOME/.github_packages

[[ -s "/Users/rgomes/.gvm/scripts/gvm" ]] && source "/Users/rgomes/.gvm/scripts/gvm"

# Personal tyro scripts
export PATH=$PATH:$HOME/Tyro/scripts

# Copilot
export NODE_EXTRA_CA_CERTS=/Library/Certificates/allcerts.pem

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/rgomes/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)

# TheFuck
eval $(thefuck --alias)
eval $(thefuck --alias fk)

# Bat
export BAT_THEME="Dracula"

# Atuin
eval "$(atuin init zsh)"
