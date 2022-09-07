#!/usr/bin/env sh

export PATH="$PATH:$HOME/.nix-profile/bin"

export GPG_TTY="$(tty)"

/etc/profiles/per-user/${USER}/bin/gopass-jsonapi listen

exit $?
