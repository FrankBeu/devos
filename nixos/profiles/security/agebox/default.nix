{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    agebox                            ### https://github.com/slok/agebox
  ];
}
