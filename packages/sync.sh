#!/bin/bash

if [ $# -lt 1 ]; then
    echo "Usage: $0 [install|delete]"
    exit 1
fi

case "$1" in
    install)
	# Restow will delete existing before installing. Useful for pruning unused symlinks
        stow --verbose --target="$HOME" --restow */
        ;;
    delete)
        stow --verbose --target="$HOME" --delete */
        ;;
    *)
        echo "Unvalid argument. Usage: $0 [install|delete]"
        exit 1
        ;;
esac
