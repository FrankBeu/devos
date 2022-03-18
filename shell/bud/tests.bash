### TODO: register tests automatically
###       get all attributes of tests and pass them to `nix build`
###       here: order can be easily specified

### HOME


### NIXOS
nix build .#tests.nixos.modules.colorscheme
nix build .#tests.nixos.modules.variables

nix build .#tests.nixos.profiles.console
nix build .#tests.nixos.profiles.editor.vim
nix build .#tests.nixos.profiles.filemanager.ranger
nix build .#tests.nixos.profiles.timezone.amsterdam


### HOSTS
nix build .#tests.hosts.NixOS
nix build .#tests.hosts.ryzen

