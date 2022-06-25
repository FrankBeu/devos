### TODO: register tests automatically
###       get all attributes of tests and pass them to `nix build`
###       here: order can be easily specified
###       here: name can easily be copied
###       here: shows missing/disabled tests
### ATTENTION: switch after update
cd ${FLAKEROOT}


allTests=(
### BUD
# tests.bud.colors                                  ### TODO: implement
# tests.bud.get                                     ### TODO: implement
tests.bud.nuke
tests.bud.prepvm
# tests.bud.sudoBurn                                ### TODO: implement
tests.bud.template
tests.bud.testCreate
# tests.bud.testInteractive                         ### TODO: implement
# tests.bud.testPrebuild                            ### TODO: implement
# tests.bud.testRun                                 ### TODO: implement
# tests.bud.testRunAll                              ### TODO: implement


### NIXOS
tests.nixos.modules.colorscheme
tests.nixos.modules.variables


tests.nixos.profiles.autologin.root
tests.nixos.profiles.autologin.variable
tests.nixos.profiles.bud
tests.nixos.profiles.console
# tests.nixos.profiles.core                         ### TODO: implement
tests.nixos.profiles.currentSystemPackages
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
tests.nixos.profiles.manualActions
tests.nixos.profiles.security.agebox
tests.nixos.profiles.services.documentation
# tests.nixos.profiles.services.printing            ### TODO: implement
tests.nixos.profiles.services.ssh
# tests.nixos.profiles.services.xserver             ### TODO: implement
# tests.nixos.profiles.sound                        ### TODO: implement
# tests.nixos.profiles.systemd.sleepDisable         ### TODO: implement
tests.nixos.profiles.timezone.amsterdam
# tests.nixos.profiles.tools.less                   ### TODO: implement
# tests.nixos.profiles.tools.network                ### TODO: implement
# tests.nixos.profiles.tools.nixTools               ### TODO: implement
tests.nixos.profiles.tools.android
tests.nixos.profiles.tools.bandwhich
tests.nixos.profiles.tools.drawio
tests.nixos.profiles.tools.exa
tests.nixos.profiles.tools.gotask
tests.nixos.profiles.tools.gpu
tests.nixos.profiles.tools.grex
tests.nixos.profiles.tools.gucharmap
tests.nixos.profiles.tools.hyperfine
tests.nixos.profiles.tools.less
tests.nixos.profiles.tools.lsof
tests.nixos.profiles.tools.network
tests.nixos.profiles.tools.nixTools
tests.nixos.profiles.tools.parted
tests.nixos.profiles.tools.procs
tests.nixos.profiles.tools.qalculate
tests.nixos.profiles.tools.system
tests.nixos.profiles.tools.tokei
tests.nixos.profiles.tools.usbutils
tests.nixos.profiles.tools.xorg
tests.nixos.profiles.tools.zathura
tests.nixos.profiles.tools.zip
tests.nixos.profiles.tools.zoxide
tests.nixos.profiles.video.vlc
tests.nixos.profiles.video.youtubedownloader
tests.nixos.profiles.virtualisation.docker
tests.nixos.profiles.virtualisation.libvirtd
tests.nixos.profiles.virtualisation.virtmanager

tests.nixos.suites.dnsRegular
tests.nixos.suites.docLocal
# tests.nixos.suites.gnome                          ### TODO: needs hw-acceleration
# tests.nixos.suites.i3                             ### TODO: needs hw-acceleration
tests.nixos.suites.rustTools
tests.nixos.suites.virtmanager


### HOME
tests.home.profiles.alacritty
tests.home.profiles.bat
tests.home.profiles.browser.chromium
tests.home.profiles.browser.firefox.main
tests.home.profiles.browser.firefox.orgCapture
tests.home.profiles.browser.firefox.tridactyl
tests.home.profiles.clipmenu
tests.home.profiles.directoryStructure
tests.home.profiles.display.cursor
tests.home.profiles.display.i3
tests.home.profiles.dotLocal
tests.home.profiles.editor.emacs                    ### TODO: needs hw-acceleration
tests.home.profiles.exa
tests.home.profiles.flameshot
# tests.home.profiles.filemanager.ranger            ### TODO: implement ?? nec check if configuration is already defined via nixos - remove profile
tests.home.profiles.git
tests.home.profiles.i18n.fcitx.varA
tests.home.profiles.i18n.fcitx.varB
tests.home.profiles.languages.golang
tests.home.profiles.manualActions
tests.home.profiles.notification.dunst
tests.home.profiles.ripgrep
tests.home.profiles.rofi
tests.home.profiles.security.age
tests.home.profiles.security.gocryptfs
tests.home.profiles.security.gopass
tests.home.profiles.security.sops
tests.home.profiles.security.ssh
tests.home.profiles.security.summon
tests.home.profiles.shell.aliases
tests.home.profiles.shell.cod
tests.home.profiles.shell.fuzzy.fzf
tests.home.profiles.shell.fuzzy.skim
tests.home.profiles.shell.nushell
tests.home.profiles.shell.prompts.powerline
tests.home.profiles.shell.prompts.starship
tests.home.profiles.shell.snippets.pet
tests.home.profiles.shell.vivid
tests.home.profiles.shell.zsh
# tests.home.profiles.stateVersion                  ### TODO reactivate after nixos-option is fixed
tests.home.profiles.tools.nixTools

tests.home.suites.zsh


### HOSTS
tests.hosts.test
tests.hosts.ryzen
)

for i in "${allTests[@]}"; do
  echo "▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ nix build .#${i}"
  nix build ${FLAKEROOT}#${i}
done
