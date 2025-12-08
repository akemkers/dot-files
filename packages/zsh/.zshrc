# If you come from bash you might have to change your $PATH.
#export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="af-magic"

# CASE_SENSITIVE="true"
# HYPHEN_INSENSITIVE="true"

zstyle ':omz:update' mode disabled  # disable automatic updates - run `omz update` manually
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
  # Zinit plugin manager (faster than zplug)
  source /opt/homebrew/opt/zinit/zinit.zsh

  # Pure theme (load immediately - it's a prompt)
  zinit ice pick"async.zsh" src"pure.zsh"
  zinit light sindresorhus/pure

  # Autosuggestions - turbo mode loads AFTER prompt appears
  zinit ice wait lucid atload"_zsh_autosuggest_start"
  zinit light zsh-users/zsh-autosuggestions
fi

# custom prompt
#export PURE_PROMPT_SYMBOL=🤷🏼‍♂️🤠

# Skip OMZ's compinit - zinit handles it
skip_global_compinit=1
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
alias claude="~/.claude/local/claude"

# Docker path
export PATH=$PATH:~/.docker/bin

# User bin path
export PATH=$PATH:~/bin

if [[ "$(uname)" == "Darwin" ]]; then
  # Overide default utils with gnubin utils. Needed for SB1 scripts that require GNU version, and for some reason TMUX messes up the path
  export PATH="/opt/homebrew/bin:$PATH"
  export PATH="/opt/homebrew/opt/grep/libexec/gnubin:/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"

  export PATH="/Users/andreas.foldvik.kemkers/.config/herd-lite/bin:$PATH"
  export PHP_INI_SCAN_DIR="/Users/andreas.foldvik.kemkers/.config/herd-lite/bin:$PHP_INI_SCAN_DIR"

  [ -f /Users/andreas.foldvik.kemkers/opt/etc/shrc ] && . /Users/andreas.foldvik.kemkers/opt/etc/shrc

  # Node version manager - lazy loaded for faster shell startup
  export NVM_DIR="$HOME/.nvm"
  lazy_load_nvm() {
    unset -f nvm node npm npx pnpm yarn
    [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"
    [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"
  }
  nvm() { lazy_load_nvm && nvm "$@"; }
  node() { lazy_load_nvm && node "$@"; }
  npm() { lazy_load_nvm && npm "$@"; }
  npx() { lazy_load_nvm && npx "$@"; }
  pnpm() { lazy_load_nvm && pnpm "$@"; }
  yarn() { lazy_load_nvm && yarn "$@"; }
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
# alias cd="z"

# secrets
if ! [ -f ~/.zsh_secrets ]; then
  echo "Secrets file not found"
else
  . ~/.zsh_secrets
fi

# Enable vim mode for zsh
bindkey -v


