{ pkgs, ... }:
{
  environment = {
    systemPackages = with pkgs; [
      youtube-dl
    ];

    shellAliases = {
      y = "youtube-dl --add-metadata";
    };
  };
}
