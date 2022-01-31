{ config, lib, pkgs, inputs, ... }:
let
  colors = config.colorscheme.colors;
in {
  home.file."test".text = ''
    "#${colors.base05}"
    "#${colors.base00}"
  '';
}
