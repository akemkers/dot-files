# dot-files

Personal config, managed with GNU stow. See README.md for install and package layout.
The package list per OS lives in `install.sh`. Do not repeat it here.

## Rules
- A new package must also be added to `felles`, `mac` or `linux` in `install.sh`
- Stow ignores `.gitignore` and links every file in a package. Never leave runtime state (logs, sockets, plugins, caches) inside `packages/`, it gets linked back
- Run `stow -n -v <package>` before a real stow and show the result
- herdr may be running and this session may run inside it. Do not restow herdr without asking
- `~/.gitconfig` is local per machine and holds `[user]`. Shared git config goes in `packages/git/.config/git/config`
- `nvim` and `nvim-custom` are separate repos. Keep them out of this one
- The repo is public. No secrets or tokens in any file
- Commit messages: Norwegian, short, lowercase, style "legger til X" as in the history
