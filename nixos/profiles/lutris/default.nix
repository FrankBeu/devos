{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    lutris
    wine
    winetricks
  ];
}
### TODO DOC
### https://nixos.wiki/wiki/Wine
### TODO configuration
### https://lutris.net/games/dcs-world/ lutris:dcs-world-open-beta
