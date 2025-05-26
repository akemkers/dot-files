# If you come from bash you might have to change your $PATH.
#export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME=""

# CASE_SENSITIVE="true"
# HYPHEN_INSENSITIVE="true"

# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time
# zstyle ':omz:update' frequency 13

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Add wisely, as too many plugins slow down shell startup.
plugins=(git)



#### CUSTOM SETTINGS ####

if [[ "$(uname)" == "Darwin" ]]; then
  export ZPLUG_HOME=/opt/homebrew/opt/zplug
else
  export ZPLUG_HOME=/usr/share/zplug
fi
source $ZPLUG_HOME/init.zsh

zplug "mafredri/zsh-async", from:github
zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme
zplug "zsh-users/zsh-autosuggestions", as:plugin, defer:2

zplug load
# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
   echo; zplug install
fi

# custom prompt
#export PURE_PROMPT_SYMBOL=🤷🏼‍♂️🤠

source $ZSH/oh-my-zsh.sh

alias rb='source ~/.zshrc'
alias bp='nvim ~/.zshrc'
alias branch='git checkout $(git branch | fzf)'
alias cdawl='cd ~/git/awl-monorepo/apps/team-sparing/'
alias cddotfiles='cd ~/git/dot-files'
alias ll='ls -al'
alias bi='brew install --appdir ~/Applications'
alias gv='lazygit'
alias nvim-lazy='NVIM_APPNAME="nvim-lazy" nvim'
alias dvim="docker run --detach-keys='ctrl-z,z' -v utvikler-home:/home/user -v /var/run/docker.sock:/var/run/docker.sock -p 3000:3000 -p 5173:5173 -p 8080:8080 -it --rm dvim zsh"

# Docker path
export PATH=$PATH:~/.docker/bin

if [[ "$(uname)" == "Darwin" ]]; then
  # Overide default utils with gnubin utils. Needed for SB1 scripts that require GNU version, and for some reason TMUX messes up the path
  export PATH="/opt/homebrew/bin:$PATH"
  export PATH="/opt/homebrew/opt/grep/libexec/gnubin:/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"

  export PATH="/Users/andreas.foldvik.kemkers/.config/herd-lite/bin:$PATH"
  export PHP_INI_SCAN_DIR="/Users/andreas.foldvik.kemkers/.config/herd-lite/bin:$PHP_INI_SCAN_DIR"

  [ -f /Users/andreas.foldvik.kemkers/opt/etc/shrc ] && . /Users/andreas.foldvik.kemkers/opt/etc/shrc

  # Node version manager
  export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
fi

## SSH
# SSH Agent should be running, once
if ! ps -ef | grep "[s]sh-agent" &>/dev/null; then
echo Starting SSH Agent
eval $(ssh-agent -s)
fi

# Add identities if none are added
if ! ssh-add -l &>/dev/null; then
echo Adding identities to SSH Agent
find ~/.ssh -type f -name 'id_*' ! -name '*.pub' | xargs ssh-add
fi

# GO PATH
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# Rust PATH
export PATH=$PATH:$HOME/.cargo/bin

# Zoxide
eval "$(zoxide init zsh)"
alias cd="z"

# secrets
if ! [ -f ~/.zsh_secrets ]; then
  echo "Secrets file not found"
else
  . ~/.zsh_secrets
fi

# Enable vim mode for zsh
bindkey -v



