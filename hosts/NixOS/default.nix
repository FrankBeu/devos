{ suites, profiles, ... }:
let mainUser = "nixos";
in
{
  ### DO NOT IMPORT ANY OTHER PROFILES OR SUITES
  ### NixOS is only used as test-host
  imports =   [
    ./variables

    profiles.users."${mainUser}"
    profiles.users.root
  ];

  ### autologin on console
  services.getty.autologinUser = "${mainUser}";

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.networkmanager.enable = true;

  fileSystems."/" = { device = "/dev/disk/by-label/nixos"; };
}
