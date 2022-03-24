### TODO: register tests automatically
###       get all attributes of tests and pass them to `nix build`
###       here: order can be easily specified

allTests=(
### HOME
# tests.home.profiles.git

### NIXOS
tests.nixos.modules.colorscheme
tests.nixos.modules.variables

tests.nixos.profiles.console
tests.nixos.profiles.editor.vim
tests.nixos.profiles.filemanager.ranger
tests.nixos.profiles.services.documentation
tests.nixos.profiles.timezone.amsterdam

tests.nixos.suites.docLocal

### HOSTS
tests.hosts.NixOS
tests.hosts.ryzen
)

for i in "${allTests[@]}"; do
  echo "▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ nix build .#${i}"
  nix build .#${i}
done
