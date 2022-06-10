{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    grex                       ###  generate regexes; https://github.com/pemistahl/grex
  ];
}
