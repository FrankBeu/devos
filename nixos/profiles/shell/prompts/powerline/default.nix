{ config, pkgs,  ... }:
{
  environment.systemPackages = with pkgs; [
    powerline-go         ### https://github.com/justjanne/powerline-go go
  ];

  programs.zsh = {
    enable = true;
    promptInit = ''
      ${builtins.readFile ./powerlineGo.zsh}
    '';
  };
}
