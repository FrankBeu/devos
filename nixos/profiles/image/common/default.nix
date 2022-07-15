{ pkgs, ... }:
{
  environment = {
    systemPackages = with pkgs; [
      riv                                           ### https://github.com/Davejkane/riv
      imagemagick
      img2pdf
    ];

    shellAliases = {
      riva = "riv '*'";
    };
  };
}
### TODO to homemanager
