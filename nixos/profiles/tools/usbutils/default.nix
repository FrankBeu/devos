{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    usbutils                   ###  lsusb
  ];
}
