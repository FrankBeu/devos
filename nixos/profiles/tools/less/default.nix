{
  programs.less = {
    enable     = true; ### already set in /nix/store/HASH-source/nixos/modules/programs/environment.nix
    configFile = ./less/lesskey;

    # lessopen  = "|${pkgs.lesspipe}/bin/lesspipe.sh %s"; ### DEFAULT
    # lessclose = "";                                     ### DEFAULT
  };
}
