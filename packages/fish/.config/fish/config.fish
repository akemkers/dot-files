if status is-interactive
    # Vim mode
    fish_vi_key_bindings
    set -U fish_greeting

    set -gx EDITOR nvim

    # Homebrew
    fish_add_path /opt/homebrew/bin

    # Aliases
    alias gv="lazygit"
    alias rb='source ~/.config/fish/config.fish'

    # Theme
    #fish_config theme save  "Catppuccin Mocha"

    # GO
    set -gx GOPATH $HOME/go
    fish_add_path $GOPATH/bin

    # Rust
    fish_add_path $HOME/.cargo/bin
end

