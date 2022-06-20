{ pkgs, ... }:
{
  home.packages = with pkgs; [
    gocryptfs            ### https://github.com/rfjakob/gocryptfs
  ];
}
