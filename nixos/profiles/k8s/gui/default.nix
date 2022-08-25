{ config, pkgs, ...}:
{
  environment.systemPackages = with pkgs; [
    lens
    octant
  ];
}
