{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    exa
  ];
}
