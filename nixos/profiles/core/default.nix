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

  ### This is just a representation of the nix default
  nix.systemFeatures = [ "nixos-test" "benchmark" "big-parallel" "kvm" ];

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

    ### Starship is a fast and featureful shell prompt
    ### starship.toml has sane defaults that can be changed there
    shellInit = ''
      export STARSHIP_CONFIG=${
        pkgs.writeText "starship.toml"
        (fileContents ./starship.toml)
      }
    '';

  };


  fonts = {
    fonts = with pkgs; [ powerline-fonts dejavu_fonts ];

    fontconfig.defaultFonts = {
      monospace = [ "DejaVu Sans Mono for Powerline" ];
      sansSerif = [ "DejaVu Sans"                    ];
    };
  };

  nix = {
    ### Improve nix store disk usage
    autoOptimiseStore  = true;
    gc.automatic       = true;
    optimise.automatic = true;

    ### Prevents impurities in builds
    useSandbox = true;

    ### give root and @wheel special privileges with nix
    trustedUsers = [ "root" "@wheel" ];

    ### Generally useful nix option defaults
    extraOptions = pkgs.lib.mkDefault ''
      min-free = 536870912
      keep-outputs = true
      keep-derivations = true
      fallback = true
    '';

  };
  #   ### Enable starship
  #   promptInit = ''
  #     eval "$(${pkgs.starship}/bin/starship init bash)"
  #   '';
  #   ### Enable direnv, a tool for managing shell environments
  #   interactiveShellInit = ''
  #     eval "$(${pkgs.direnv}/bin/direnv hook bash)"
  #   '';
  # };

  programs.zsh = {
    enable = true;
    ### Enable starship
    promptInit = ''
      eval "$(${pkgs.starship}/bin/starship init zsh)"
    '';
    ### Enable direnv, a tool for managing shell environments
    interactiveShellInit = ''
      eval "$(${pkgs.direnv}/bin/direnv hook zsh)"
    '';
  };

  ### Service that makes Out of Memory Killer more effective
  services.earlyoom.enable = true;

}
