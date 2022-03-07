{
  programs.direnv = {
    enable     = true;
    nix-direnv = {
      enable = true;
    };
  };

  home.shellAliases = {
    da = "direnv allow"  ;  ### Direnv Allow
    dr = "direnv reload" ;  ### Direnv Reload
  };
}
