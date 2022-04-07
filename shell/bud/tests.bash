### TODO: register tests automatically
###       get all attributes of tests and pass them to `nix build`
###       here: order can be easily specified
###       here: name can easily be copied

allTests=(
### HOME
tests.home.profiles.alacritty
tests.home.profiles.display.i3
tests.home.profiles.git

### NIXOS
tests.nixos.modules.colorscheme
tests.nixos.modules.variables

tests.nixos.profiles.alacritty
tests.nixos.profiles.autologin.mainUser
tests.nixos.profiles.autologin.root
tests.nixos.profiles.console
tests.nixos.profiles.display.i3
tests.nixos.profiles.display.statusBar.i3statusBar
tests.nixos.profiles.domain.local
tests.nixos.profiles.domain.server
tests.nixos.profiles.domain.variable
tests.nixos.profiles.editor.vim
tests.nixos.profiles.filemanager.ranger
tests.nixos.profiles.services.documentation
tests.nixos.profiles.timezone.amsterdam

tests.nixos.suites.dnsRegular
tests.nixos.suites.docLocal
tests.nixos.suites.i3

### HOSTS
tests.hosts.NixOS
tests.hosts.ryzen
)

for i in "${allTests[@]}"; do
  echo "▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ nix build .#${i}"
  nix build .#${i}
done
