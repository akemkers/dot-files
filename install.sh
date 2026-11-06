#!/usr/bin/env bash
# Stower pakkene for denne maskinen. Argumenter går videre til stow, f.eks. -n -v.
set -euo pipefail
cd "$(dirname "$0")"

felles=(delta fish git herdr ideavim kitty lazygit sesh tmux yazi zsh)
mac=()
linux=(hypr rofi scripts waybar waypaper wlogout)

case "$(uname)" in
  Darwin) pakker=("${felles[@]}" "${mac[@]}") ;;
  Linux)  pakker=("${felles[@]}" "${linux[@]}") ;;
  *)      echo "Ukjent OS: $(uname)" >&2; exit 1 ;;
esac

stow -R "$@" "${pakker[@]}"
