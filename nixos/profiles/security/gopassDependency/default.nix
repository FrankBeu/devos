{ pkgs, ... }:
{
  services.dbus.packages = [ pkgs.gcr ];### dependency for pinentry-gnome
}
