{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    bind                       ###  dig
    ethtool
    gobuster
    ldns                       ###  drill, ...
  ];
}
