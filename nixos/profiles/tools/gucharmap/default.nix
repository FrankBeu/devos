{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    gnome3.gucharmap           ###  unicode
  ];
}
