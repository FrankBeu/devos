{ pkgs, ... }:
{
  home = {
    packages = with pkgs; [
      pistol
      mediainfo
    ];

    file.".config/pistol/pistol.conf".text = (import ./pistol/pistol.conf.nix);
  };
}
