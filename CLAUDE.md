# Personal Dot-Files Project

## Overview
Personal development environment configuration using GNU Stow for symlink management. Contains mixed macOS and Linux packages - install selectively per platform rather than using bulk installation.

## Project Structure
```
dot-files/
├── packages/           # Stow packages (each directory = one package)
│   ├── fish/          # Fish shell config (cross-platform)
│   ├── hypr/          # Hyprland compositor config (Linux only)
│   ├── ideavim/       # IdeaVim configuration (cross-platform)
│   ├── kitty/         # Terminal emulator (cross-platform)
│   ├── rofi/          # Application launcher (Linux only)
│   ├── scripts/       # Custom system scripts (Linux focused)
│   ├── sesh/          # Session manager for tmux (cross-platform)
│   ├── tmux/          # Terminal multiplexer (cross-platform)
│   ├── waybar/        # Status bar (Linux only)
│   ├── waypaper/      # Wallpaper manager (Linux only)
│   ├── wlogout/       # Logout menu (Linux only)
│   └── zsh/           # Zsh shell config (cross-platform)
├── intellij/          # IntelliJ IDEA settings
├── mac-setup.md       # macOS setup guide (Norwegian)
└── README.md          # Stow usage documentation
```

## Installation
**Note**: Contains mixed platform packages. Install selectively:
- **Install single package**: `stow --target=$HOME <package-name>`
- **Remove single package**: `stow --target=$HOME --delete <package-name>`
- **Check before install**: Review package contents for platform compatibility

## Package Details

### Cross-Platform Packages

#### Fish Shell (`packages/fish/`)
- **Config**: `.config/fish/config.fish`
- **Features**: Vi key bindings, lazy git alias, editor set to nvim
- **Paths**: GO, Rust, Homebrew (macOS conditional)

#### Zsh Shell (`packages/zsh/`)
- **Config**: `.zshrc`
- **Features**: Oh My Zsh, platform detection, SSH agent management
- **Plugins**: Pure prompt (macOS), zsh-autosuggestions
- **Aliases**: Git shortcuts, directory navigation, development tools
- **Platform logic**: Homebrew paths (macOS), different tool paths per OS

#### Kitty Terminal (`packages/kitty/`)
- **Config**: `.config/kitty/kitty.conf`
- **Font**: Hack Nerd Font Mono with 130% cell height
- **Features**: 90% background opacity, Fish shell default
- **Performance**: Optimized repaint delay (8ms)

#### Tmux (`packages/tmux/`)
- **Config**: `.config/tmux/tmux.conf`
- **Prefix**: `C-f` (instead of default C-b)
- **Theme**: Catppuccin Mocha
- **Features**: Sesh integration, vim key bindings, mouse support
- **Plugins**: tmux-resurrect, tmux-continuum, vim-tmux-navigator

#### IdeaVim (`packages/ideavim/`)
- **Config**: `.ideavimrc`
- **Leader**: Space key
- **Features**: IntelliJ action mappings, vim-style navigation
- **Bindings**: Code manipulation, search, debugging, version control

#### Sesh (`packages/sesh/`)
- **Config**: `.config/sesh/sesh.toml`
- **Sessions**: Predefined tmux sessions for config editing
- **Features**: Quick access to dotfiles, nvim config, various tools

### Linux-Only Packages

#### Hyprland (`packages/hypr/`)
- **Main config**: `.config/hypr/hyprland.conf` (sources modules)
- **Modules**:
  - `monitors.conf` - Display configuration
  - `keybinds.conf` - Keyboard shortcuts (Super key as modifier)
  - `autostart.conf` - Startup applications (waybar, waypaper, hypridle)
  - `environment.conf` - Environment variables
  - `styling.conf` - Window decoration and theming
  - `input.conf` - Input device configuration
  - `win_workspace.conf` - Window and workspace rules
  - `animations/` - Animation configurations
- **Additional configs**: `hyprpaper.conf`, `hypridle.conf`

#### Waybar (`packages/waybar/`)
- **Config**: `.config/waybar/config.jsonc`
- **Layout**: Clock/updates (left), workspaces (center), sensors/connections (right)
- **Widgets**: Temperature, GPU status, power profiles, battery, network, Bluetooth
- **Custom scripts**: GPU usage, fan status, package updates (references `~/.config/scripts/`)

#### Rofi (`packages/rofi/`)
- **Config**: `.config/rofi/config.rasi`
- **Theme**: Catppuccin Mocha (`catppuccin-mocha.rasi`)
- **Modes**: Application launcher, window switcher, file browser
- **Icons**: Nerd font icons for different modes

#### Waypaper (`packages/waypaper/`)
- **Config**: `.config/waypaper/config.ini`
- **Backend**: hyprpaper
- **Wallpapers**: `~/Pictures/Wallpapers/`
- **Integration**: Updates waybar on wallpaper change using wal

#### Wlogout (`packages/wlogout/`)
- **Config**: `.config/wlogout/layout`
- **Actions**: Lock, hibernate, logout, shutdown, suspend, reboot
- **Keybinds**: Single letter shortcuts for each action

#### Scripts (`packages/scripts/`)
- **Location**: `.config/scripts/`
- **Scripts**:
  - `check_dgpu_usage.sh` - NVIDIA GPU status monitoring
  - `check_fan_status.sh` - System fan status
  - `check_package_updates.sh` - Package update counter
  - `powerprofile-menu.sh` - Power profile management
  - `test.sh` - Testing/development script

## Current Development Environment
- **OS**: Linux (Arch-based, kernel 6.15.9)
- **Desktop**: Hyprland (Wayland compositor)
- **Terminal**: Kitty + Fish shell
- **Theme**: Catppuccin (consistent across all applications)
- **Fonts**: Hack Nerd Font Mono

## Platform Support
- **Linux**: Primary development target (Hyprland/Wayland focused)
- **macOS**: Legacy support with Homebrew integration
- **Mixed packages**: Some configs have conditional logic for platform detection

## Development Tools & Paths
- **Go**: `$GOPATH=$HOME/go`, `$PATH` includes `$GOPATH/bin`
- **Rust**: `$PATH` includes `$HOME/.cargo/bin`
- **Node.js**: NVM integration (macOS), system package manager (Linux)
- **Docker**: Custom aliases and path additions
- **Git**: SSH agent auto-start, automatic key loading

## Key Aliases & Shortcuts
- `gv` - lazygit (git UI)
- `rb` - reload shell config
- `cddotfiles` - cd to this project
- `branch` - git checkout with fzf selection
- `cd` - aliased to zoxide (`z`) for smart directory jumping

## Hyprland Key Bindings (Super key)
- `Super+Return` - Launch kitty terminal
- `Super+Space` - Rofi application launcher
- `Super+E` - File manager (yazi)
- `Super+S` - Screenshot (region to clipboard)
- `Super+F` - Fullscreen toggle
- `Super+Shift+W` - Restart waybar
- `Super+Shift+L` - Logout menu (wlogout)

## Common Maintenance Tasks
1. **Selective installation**: Install packages per platform needs
2. **Monitor configuration**: Edit `hypr/modules/monitors.conf` for display setup
3. **Waybar customization**: Modify `waybar/config.jsonc` for status bar
4. **Script updates**: Custom monitoring scripts in `.config/scripts/`
5. **Theme consistency**: Maintain Catppuccin across all applications
6. **Cross-platform testing**: Verify shell configs work on both platforms

## Git Status (Last Known)
- Modified: `packages/hypr/.config/hypr/modules/monitors.conf`
- Modified: `packages/kitty/.config/kitty/current-theme.conf`
- Modified: `packages/waybar/.config/waybar/config.jsonc`
- Untracked: `packages/waybar/.config/waybar/config-old.jsonc`

## Notes
- **Mixed platform support**: Install packages selectively based on target OS
- **Stow management**: Use individual package installation rather than bulk sync
- **Configuration paths**: Most configs use XDG standard paths (`.config/`)
- **Theme integration**: Catppuccin theme applied consistently across desktop environment
- **Custom automation**: Waypaper integration with waybar refresh and color scheme updates