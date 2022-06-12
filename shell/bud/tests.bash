### TODO: register tests automatically
###       get all attributes of tests and pass them to `nix build`
###       here: order can be easily specified
###       here: name can easily be copied
###       here: shows missing/disabled tests
### ATTENTION: switch after update


allTests=(
### NIXOS
tests.nixos.modules.colorscheme
tests.nixos.modules.variables


tests.nixos.profiles.alacritty
tests.nixos.profiles.autologin.root
tests.nixos.profiles.autologin.variable
# tests.nixos.profiles.bud                          ### TODO: implement
tests.nixos.profiles.console
# tests.nixos.profiles.core                         ### TODO: implement
# tests.nixos.profiles.display.gnome                ### TODO: needs hw-acceleration
tests.nixos.profiles.display.i3
tests.nixos.profiles.display.statusBar.i3statusBar
tests.nixos.profiles.domain.local
tests.nixos.profiles.domain.server
tests.nixos.profiles.domain.variable
tests.nixos.profiles.editor.emacs
tests.nixos.profiles.editor.vim
tests.nixos.profiles.filemanager.ranger
# tests.nixos.profiles.fonts                        ### TODO: implement
# tests.nixos.profiles.i18n.common                  ### TODO: implement
tests.nixos.profiles.i18n.fcitx
tests.nixos.profiles.image.common
tests.nixos.profiles.services.documentation
# tests.nixos.profiles.services.printing            ### TODO: implement
# tests.nixos.profiles.services.ssh                 ### TODO: implement
# tests.nixos.profiles.services.xserver             ### TODO: implement
# tests.nixos.profiles.sound                        ### TODO: implement
# tests.nixos.profiles.systemd.sleepDisable         ### TODO: implement
tests.nixos.profiles.timezone.amsterdam
# tests.nixos.profiles.tools.less                   ### TODO: implement
# tests.nixos.profiles.tools.network                ### TODO: implement
# tests.nixos.profiles.tools.nixTools               ### TODO: implement
tests.nixos.profiles.tools.bandwhich
tests.nixos.profiles.tools.exa
tests.nixos.profiles.tools.grex
tests.nixos.profiles.tools.hyperfine
tests.nixos.profiles.tools.parted
tests.nixos.profiles.tools.procs
tests.nixos.profiles.tools.qalculate
tests.nixos.profiles.tools.tokei
tests.nixos.profiles.tools.zathura
tests.nixos.profiles.tools.zoxide
tests.nixos.virtualisation.libvirtd

tests.nixos.suites.dnsRegular
tests.nixos.suites.docLocal
# tests.nixos.suites.gnome                          ### TODO: needs hw-acceleration
# tests.nixos.suites.i3                             ### TODO: needs hw-acceleration
tests.nixos.suites.rustTools


### HOME
tests.home.profiles.alacritty
tests.home.profiles.browser.chromium
# tests.home.profiles.display.cursor                ### TODO: implement
tests.home.profiles.display.i3
tests.home.profiles.editor.emacs                    ### TODO: needs hw-acceleration
# tests.home.profiles.filemanager.ranger            ### TODO: implement ?? nec check if configuration is already defined via nixos - remove profile
tests.home.profiles.git
tests.home.profiles.i18n.fcitx.varA
tests.home.profiles.i18n.fcitx.varB


### HOSTS
tests.hosts.test
tests.hosts.ryzen
)

for i in "${allTests[@]}"; do
  echo "▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ nix build .#${i}"
  nix build .#${i}
done
