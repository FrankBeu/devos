### TODO split into profiles and combine as suite
{ self, config, lib, pkgs, ... }:
let inherit (lib) fileContents;
in
{
  ### Sets nrdxp.cachix.org binary cache which just speeds up some builds
  ### TODO
  # imports = [ ../cachix ];

  ### For rage encryption, all hosts need a ssh key pair
  services.openssh = {
    enable = true;
    openFirewall = lib.mkDefault false;
  };

  environment = {
    ### Selection of sysadmin tools that can come in handy
    systemPackages = with pkgs; [
      binutils
      coreutils
      curl
      delta
      direnv
      dnsutils
      dosfstools
      fd
      git
      bottom
      gptfdisk
      iputils
      jq
      manix
      moreutils
      nixos-option ### TODO check if enabled elsewhere
      nix-index
      nmap
      ripgrep
      sd
      skim
      tealdeer
      # usbutils ### TODO add profile.tools.usbutils to core suite
      util-linux
      whois
      bindfs
    ];

  };

  fonts = {
    fonts                   = with pkgs; [ powerline-fonts dejavu_fonts ];
    fontconfig.defaultFonts = {
      monospace = [ "DejaVu Sans Mono for Powerline" ];
      sansSerif = [ "DejaVu Sans"                    ];
    };
  };

  nix = {
    ### Generally useful nix option defaults
    extraOptions       = pkgs.lib.mkDefault ''
      min-free = 536870912
      keep-outputs = true
      keep-derivations = true
      fallback = true
    '';
    gc.automatic       = true;
    optimise.automatic = true;
    settings           = {
      auto-optimise-store = true;                                              ### Improve nix store disk usage
      sandbox             = true;                                              ### Prevents impurities in builds
      system-features     = [ "nixos-test" "benchmark" "big-parallel" "kvm" ]; ### This is just a representation of the nix default
      trusted-users       = [ "root" "@wheel" ];                               ### give root and @wheel special privileges with nix
    };
  };

  ### TODO extract direnv
  programs.zsh = {
    enable = true;

    ### Enable direnv, a tool for managing shell environments
    interactiveShellInit = ''
      eval "$(${pkgs.direnv}/bin/direnv hook zsh)"
    '';
  };

  services.earlyoom.enable = true; ### Service that makes Out of Memory Killer more effective

}
