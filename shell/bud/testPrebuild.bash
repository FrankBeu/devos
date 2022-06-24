cd ${FLAKEROOT}

### rest of arguments
nix build "${@:2}" ${FLAKEROOT}#${1}.driverInteractive
