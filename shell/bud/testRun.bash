cd ${FLAKEROOT}

nix build ${FLAKEROOT}#${1}
