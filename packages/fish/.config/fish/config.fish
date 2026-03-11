if status is-interactive
    # Vim mode
    fish_vi_key_bindings
    set -U fish_greeting

    set -gx EDITOR nvim

    fish_add_path --path $HOME/.local/bin

    # macOS only
    if test "$(uname)" = Darwin
        fish_add_path --path /opt/homebrew/bin
        set -gx DOCKER_HOST "unix://$HOME/.colima/default/docker.sock"
        set -gx TESTCONTAINERS_DOCKER_SOCKET_OVERRIDE /var/run/docker.sock
    end

    # Npm scripts
    fish_add_path --path $HOME/.npm/bin

    # SB1
    fish_add_path --path $HOME/git/bob
    fish_add_path --path $HOME/opt/maven/bin
    fish_add_path --path $HOME/opt/bin
    fish_add_path --path $HOME/opt/jdk/bin

    # Aliases
    alias .. "cd .."
    alias gv="lazygit"
    alias rb='exec fish'
    alias hyp="nvim ~/.config/hypr"
    alias nl='NVIM_APPNAME="nvim-custom" command nvim'

    # GO
    set -gx GOPATH $HOME/go
    fish_add_path --path $GOPATH/bin

    # Rust
    fish_add_path --path $HOME/.cargo/bin
end
