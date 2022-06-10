{ pkgs, ... }:
{
  environment = {
    systemPackages = with pkgs; [
      riv                                           ### https://github.com/Davejkane/riv
      imagemagick
    ];

    shellAliases = {
      riva = "riv '*'";
    };
  };
}
### TODO to homemanager
