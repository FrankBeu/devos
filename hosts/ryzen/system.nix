{ self
, inputs
, lib
, profiles
, suites
, ...
}:
let
  customSchemes   = (import ../../nixos/profiles/customthemes);
  nixColorSchemes = inputs.nix-colors.colorSchemes;
  variables       = with self; (import ./variables { inherit config; }).variables;  ### prevent 'error: infinite recursion encountered'
in
{
  colorscheme = self.lib.colorscheme.loadColorScheme customSchemes nixColorSchemes variables.currentColorSchemeName;

  imports = [
    ### FILES
    ./system/hardware/hardware-configuration.nix  ### include the results of the hardware scan
    ./system/boot
    ./system/misc
    ./system/networking


    ### PROFILES
    profiles.bat
    profiles.bud
    profiles.console
    profiles.currentSystemPackages
    profiles.documentation
    profiles.domain.variable.dev
    profiles.domain.variable.stage
    # profiles.domain.variable.prod
    profiles.editor.emacs
    profiles.editor.vim
    profiles.filemanager.ranger
    profiles.fonts
    profiles.i18n.common
    # profiles.i18n.fcitx
    profiles.image.common
    profiles.k8s.cdk8s
    profiles.k8s.base
    profiles.k8s.gui
    profiles.k8s.k3d
    profiles.k8s.k3s
    # profiles.lutris                       ### TODO
    profiles.manualActions
    profiles.networking.dhcp.false
    profiles.networking.nameserver.regular
    # profiles.networking.nameserver.secure ### TODO
    profiles.security.agebox
    profiles.security.sopsNix
    profiles.security.gopassDependency
    # profiles.services.pipewire            ### TODO
    # profiles.services.printing            ### TODO
    profiles.services.ssh
    profiles.shell.prompts.starship
    profiles.shell.zsh

    # profiles.sound.default
    profiles.sound.pipewire

    # profiles.systemd.sleepDisable
    profiles.timezone.amsterdam

    profiles.tools.android
    profiles.tools.archive
    profiles.tools.drawio
    profiles.tools.gotask
    profiles.tools.gpu
    profiles.tools.gucharmap
    profiles.tools.inkscape
    profiles.tools.less
    profiles.tools.lsof
    profiles.tools.network
    profiles.tools.nixTools
    profiles.tools.parted
    profiles.tools.pdf
    profiles.tools.qalculate
    profiles.tools.revealjs
    profiles.tools.system
    profiles.tools.usbutils
    profiles.tools.xorg
    profiles.tools.zathura
    profiles.tools.zip
    profiles.video.vlc
    profiles.video.youtubedownloader
    profiles.virtualisation.docker
    # profiles.vulkan                       ### TODO

    ### AUTOLOGIN ON CONSOLE
    # profiles.autologin.mainUser
    # profiles.autologin.root

    ### DEBUG
    # profiles.systemd.coredump
  ] ++ [
    profiles.users.root
    profiles.users.frank
  ] ++
  suites.base        ++
  suites.docLocal    ++
  suites.i3          ++
  # suites.gnome     ++
  suites.rustTools   ++
  suites.virtmanager ++
  [];
}
