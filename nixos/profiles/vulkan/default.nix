{ pkgs, ... }:
{
  hardware.opengl.extraPackages = with pkgs; [
    amdvlk
  ];
  ### For 32 bit applications
  ### Only available on unstable
  hardware.opengl.extraPackages32 = with pkgs; [
    driversi686Linux.amdvlk
  ];
  hardware.opengl.driSupport = true;
  ### For 32 bit applications
  hardware.opengl.driSupport32Bit = true;
}
