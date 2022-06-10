{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    tokei                      ###  https://github.com/XAMPPRocky/tokei
  ];
}
