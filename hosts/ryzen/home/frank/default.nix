{ self
, config
, inputs
, profiles
, suites
, variables
, ...
}:
let
  inherit (config.home) username;

  customSchemes   = (import ../../../../nixos/profiles/customthemes);
  nixColorSchemes = inputs.nix-colors.colorSchemes;
in
{
  imports = [
    ../../variables
    ./kopia

    profiles.alacritty
    profiles.backup.kopia
    profiles.bat
    profiles.browser.chromium
    profiles.browser.defaultBrowser
    profiles.browser.firefox.main
    profiles.browser.firefox.orgCapture
    profiles.browser.firefox.tridactyl
    profiles.clipmenu
    profiles.directoryStructure
    profiles.direnv
    profiles.display.cursor
    profiles.display.i3
    profiles.docDotLocal
    profiles.dotLocal
    profiles.editor.emacs
    profiles.exa
    profiles.filemanager.ranger
    profiles.flameshot
    profiles.git
    # profiles.i18n.fcitx         ### kills emacs
    profiles.languages.golang
    profiles.manualActions
    profiles.notification.dunst
    profiles.pistol
    profiles.ripgrep
    profiles.rofi
    profiles.security.age
    profiles.security.gocryptfs
    profiles.security.gopass
    profiles.security.sops
    profiles.security.ssh
    profiles.security.summon
    # profiles.shell.aliases
    # profiles.shell.cod
    # profiles.shell.fuzzy.fzf
    # profiles.shell.fuzzy.skim
    profiles.shell.nushell
    # profiles.shell.prompts.powerline
    # profiles.shell.prompts.starship
    # profiles.shell.snippets.pet
    # profiles.shell.vivid
    # profiles.shell.zsh                ### depends on nixos.profiles.shell.zsh
    profiles.stateVersion
    profiles.tools.nixTools
    profiles.xdg

    # inputs.nix-colors.homeManagerModule
  ] ++
  suites.zsh ++
  [];

  colorscheme = self.lib.colorscheme.loadColorScheme customSchemes nixColorSchemes variables.users.${username}.currentColorSchemeName;
}
