cd ${FLAKEROOT}

### rest of arguments
nix "${@:2}" build ${FLAKEROOT}#${1}
