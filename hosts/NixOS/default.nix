{ suites, ... }:
{
  ### root password is empty by default ###
  imports = suites.base;

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.networkmanager.enable = true;

  fileSystems."/" = { device = "/dev/disk/by-label/nixos"; };

  ### autologin on console
  ### TODO use variable user
  services.getty.autologinUser = "nixos";

}
