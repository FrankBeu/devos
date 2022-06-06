{ pkgs, variables, ... }:
{
  services.getty.autologinUser = pkgs.lib.mkDefault variables.tty.autologin.username;
}
