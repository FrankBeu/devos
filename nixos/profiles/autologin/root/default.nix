{ pkgs, ... }:
{
  services.getty.autologinUser = pkgs.lib.mkForce "root";
}
