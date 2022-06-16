
  xdg.configFile."i3/config".text = pkgs.lib.mkDefault( pkgs.lib.mkAfter ''
    ${(import ./i3/additional.nix )}
  '' );

