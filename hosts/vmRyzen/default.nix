{ lib
, pkgs
, profiles
, suites
, ...
}:
{
  imports = [
    ../ryzen
  ];

  networking.interfaces = pkgs.lib.mkForce {} // { eth0.useDHCP = true; };
  services.qemuGuest.enable = true;  ### TODO ??

  ### TODO check
  nix.extraOptions = pkgs.lib.mkForce ''
      min-free = 536870912
      keep-outputs = true
      keep-derivations = true
    '';
}
