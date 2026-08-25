# If you come from bash you might have to change your $PATH.
#export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME=""  # Disable oh-my-zsh theme (using zinit's Pure theme instead)

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


# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# FPATH er eksportert, så nøstede shell (tmux, subshell) arver og legger på.
# Uten dedup vokser lista, og omz kaster completion-cachen fordi den
# sammenligner fpath tegn for tegn.
typeset -U fpath

# Rammeverket koster 130 ms, hvorav 65 ms er bokføring for å avgjøre om
# completion-cachen må bygges på nytt: git rev-parse i ~/.oh-my-zsh, scutil
# for vertsnavn, og tre grep mot dumpfila. Vi laster innholdet direkte.
if [[ -o interactive ]]; then
  ZSH_CACHE_DIR="$ZSH/cache"
  ZSH_COMPDUMP="$HOME/.zcompdump-${HOST%%.*}-${ZSH_VERSION}"
  autoload -Uz compinit
  # Full sjekk bare hvis dumpen er eldre enn et døgn
  _zcd=( $ZSH_COMPDUMP(N.mh+24) )
  (( $#_zcd )) && compinit -i -d $ZSH_COMPDUMP || compinit -C -d $ZSH_COMPDUMP
  for _f in $ZSH/lib/*.zsh; do source $_f; done
  source $ZSH/plugins/git/git.plugin.zsh
  unset _zcd _f
fi



#### CUSTOM SETTINGS ####

if [[ "$(uname)" == "Darwin" ]]; then
  # Only load zinit plugins for interactive shells (oh-my-zsh already initialized completions)
  if [[ -o interactive ]]; then
    # Zinit plugin manager (faster than zplug)
    source /opt/homebrew/opt/zinit/zinit.zsh

    # Pure theme (load immediately - it's a prompt)
    zinit ice pick"async.zsh" src"pure.zsh"
    zinit light sindresorhus/pure

    # Autosuggestions - turbo mode loads AFTER prompt appears
    zinit ice wait lucid atload"_zsh_autosuggest_start"
    zinit light zsh-users/zsh-autosuggestions
  fi
fi

alias rb='source ~/.zshrc'
alias bp='nvim ~/.zshrc'
alias ll='ls -al'
alias bi='brew install --appdir ~/Applications'
alias gv='lazygit'
alias nvim-lazy='NVIM_APPNAME="nvim-lazy" nvim'
alias dvim="docker run --detach-keys='ctrl-z,z' -v utvikler-home:/home/user -v /var/run/docker.sock:/var/run/docker.sock -p 3000:3000 -p 5173:5173 -p 8080:8080 -it --rm dvim zsh"

# Claude path
export PATH=$PATH:~/.claude/local

# Docker path
export PATH=$PATH:~/.docker/bin
export TESTCONTAINERS_RYUK_DISABLED=false

# User bin path
export PATH=$PATH:~/bin

if [[ "$(uname)" == "Darwin" ]]; then
  # Overide default utils with gnubin utils. Needed for SB1 scripts that require GNU version, and for some reason TMUX messes up the path
  export PATH="/opt/homebrew/bin:$PATH"
  export PATH="/opt/homebrew/opt/grep/libexec/gnubin:/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"

  export PATH="/Users/andreas.foldvik.kemkers/.config/herd-lite/bin:$PATH"
  export PHP_INI_SCAN_DIR="/Users/andreas.foldvik.kemkers/.config/herd-lite/bin:$PHP_INI_SCAN_DIR"

  # aws_completer.sh og bob-completion.sh i shrc.d kaller compinit på nytt.
  # Omz har alt initialisert completion, så vi nuller kallene deres.
  # Linja under må stå ordrett. provision-dev finner hooken sin med grep -F,
  # og legger den inn på nytt nederst i fila hvis den ikke kjenner den igjen.
  [[ -o interactive ]] && functions[compinit]=':'
  [ -f /Users/andreas.foldvik.kemkers/opt/etc/shrc ] && . /Users/andreas.foldvik.kemkers/opt/etc/shrc
  if [[ -o interactive ]]; then
    unfunction compinit
    autoload -Uz compinit
  fi

fi

# GO PATH
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# Rust PATH
export PATH=$PATH:$HOME/.cargo/bin

# secrets
if ! [ -f ~/.zsh_secrets ]; then
  echo "Secrets file not found"
else
  . ~/.zsh_secrets
fi

# Enable vim mode for zsh
bindkey -v
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
