{ config, pkgs,  ... }:
let
  systemPkgs = pkgs;
in
{
  home.packages = with pkgs; [

    ### TODO write overlay
    powerline-go         ### https://github.com/justjanne/powerline-go go
  ];

  programs.zsh = {
    initExtraBeforeCompInit = ''
      ${builtins.readFile ./powerlineGo.zsh}
    '';
    # initExtra = ''
    #    '';
  };
}
