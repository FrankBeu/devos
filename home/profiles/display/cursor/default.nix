{ pkgs, ... }:
let
  # cursorName = "nordzy";
  # cursorName = "nordzy-white";
  cursorName = "bibata";

  size = 32;
  # size = 64;

  cursor = (import (./. + "/${cursorName}") { inherit pkgs; });
in
{
  home = {
    packages = [
      pkgs.find-cursor  ### https://github.com/arp242/find-cursor
    ];
    ### TODO condI3config for find-cursor
    ### TODO https://github.com/alvatip/Nordzy-icon nordzy-icon-theme

    pointerCursor = {
      x11 = {
        enable = true;
        inherit (cursor) defaultCursor;
      };
      inherit (cursor)
      package
      name
      ;

      inherit size;
    };
  };

  services.unclutter = {
    enable  = true;
    timeout = 2;
  };

}
