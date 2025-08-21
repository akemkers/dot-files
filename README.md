# config
Configuration and documentation for my personal development setup


## How to manage the dotfiles
Instead of directly copying the dotfiles to their locations on a new system, the project is setup to make use of symlinks through the [GNU stow](https://www.gnu.org/software/stow/) project.

First make sure stow is installed on the target system. Example for mac.
```
brew install stow
```
## TLDR
**Note**: Contains mixed macOS and Linux packages. Install selectively per platform rather than using bulk installation.

- **Install single package**: `stow --target=$HOME <package-name>`
- **Remove single package**: `stow --target=$HOME --delete <package-name>`
- **Check before install**: Review package contents for platform compatibility 

### File structure
Stow operates in terms of `packages`. A package is simply a directory under the dotfiles project which contains files to be symlinked.

A package can contain files on its root, or it can contain a directories. 
The placement of a file should reflect where the symlink is supposed to exist on the target system, relative to the root location provided to `stow`.

Example placing a file directly under home root:
```
# The zshrc file goes directly on root, so we place it on the root of the package. 

dotfiles
  |_zsh
    |_.zshrc

stow --target=$HOME zsh
```

Example: placing a symlink under the .config directory.
```
# The tmux config goes under '$HOME/.config/tmux/tmux.conf' so we mirror this placement in the package. 

dotfiles
  |_tmux
    |_.config
      |_tmux
        |_tmux.conf

stow --target=$HOME tmux
```

 
### Installation
**Installing/updating the symlinks**
As displayed above you can install a given package by running the stow binary with a package-name as the parameter.
Use the flag `--target` to tell stow where you want it installed. 

**Warning**: Bulk installation with `stow --target=$HOME */` is not recommended due to mixed platform packages. Install packages individually based on your platform needs.


**Uninstalling the symlinks**
You can delete (or "unstow") a package by adding a the `--delete` flag. 

```
stow --target=$HOME --delete tmux 
```

or deleting all symlinked packages from the system.
```
stow --target=$HOME --delete */ 
```



