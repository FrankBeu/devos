{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    parted                     ###  disk
  ];
}
