if status is-interactive
    # Vim mode
    fish_vi_key_bindings
    set -U fish_greeting

    set -gx EDITOR nvim

    # Homebrew
    fish_add_path /opt/homebrew/bin

    # Npm scripts
    fish_add_path $HOME/.npm/bin

    # SB1
    fish_add_path /Users/andreas.foldvik.kemkers/git/bob
    fish_add_path /Users/andreas.foldvik.kemkers/opt/maven/bin
    fish_add_path /Users/andreas.foldvik.kemkers/opt/bin
    fish_add_path /Users/andreas.foldvik.kemkers/opt/jdk/bin

    # Aliases
    alias .. "cd .."
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




