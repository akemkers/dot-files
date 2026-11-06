# dot-files
Configuration for my personal development setup, managed with [GNU stow](https://www.gnu.org/software/stow/).

## Install
```
brew install stow   # or the distro package on Linux
git clone git@github.com:akemkers/dot-files.git ~/.config/dot-files
~/.config/dot-files/install.sh
```

`install.sh` stows the packages for the current OS. Run it again after pulling to pick up new files.
Arguments are passed on to stow, so `./install.sh -n -v` shows what would change without touching anything.

Git reads `[user]` from `~/.gitconfig`, which is not in the repo. Create it on each machine:
```
git config --global user.name "..."
git config --global user.email "..."
```

## Packages
Each directory under `packages/` mirrors `$HOME`. `packages/tmux/.config/tmux/tmux.conf` becomes `~/.config/tmux/tmux.conf`.

`.stowrc` sets `--dir=packages`, `--target=~` and `--no-folding`, so plain `stow <package>` works from the repo root.
No-folding means stow links each file, never whole directories. Files the tools write themselves (plugins, logs, state) stay outside the repo.

To add a tool:
1. Move its config into `packages/<name>/` with the same path as under `$HOME`
2. Add `<name>` to the right list in `install.sh`
3. Run `stow <name>`

To remove a package: `stow -D <name>`.
