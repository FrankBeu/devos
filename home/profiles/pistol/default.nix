{ pkgs, ... }:
{
  home = {
    packages = with pkgs; [
      pistol
    ];

    file.".config/pistol/pistol.conf".text = (import ./pistol/pistol.conf.nix);
  };
}
