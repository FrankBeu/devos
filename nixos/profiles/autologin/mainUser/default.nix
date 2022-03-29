{ pkgs, variables, ... }:
{
  services.getty.autologinUser = pkgs.lib.mkDefault variables.mainUser.name;
}
