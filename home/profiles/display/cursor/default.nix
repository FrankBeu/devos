{ pkgs, ... }:
let
  # cursorName = "nordzy";
  # cursorName = "nordzy-white";
  cursorName = "bibata";

  size = 32;
  # size = 64;
in
{
  home.packages = [
    pkgs.find-cursor  ### https://github.com/arp242/find-cursor
  ];
  ### TODO condI3config for find-cursor
  ### TODO https://github.com/alvatip/Nordzy-icon nordzy-icon-theme

  xsession.pointerCursor =
    {
      inherit (import (./. + "/${cursorName}") { inherit pkgs; })
      package
      name
      defaultCursor;

      inherit
      size;
    };

  services.unclutter = {
    enable  = true;
    timeout = 2;
  };

}
