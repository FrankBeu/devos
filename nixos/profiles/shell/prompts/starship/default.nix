{ lib, pkgs, ... }:
let
  inherit (lib) fileContents;
in
{

  programs.zsh = {
    enable     = true;
    promptInit = ''
      eval "$(${pkgs.starship}/bin/starship init zsh)"
    '';
  };

  programs.bash = {
    promptInit = ''
      eval "$(${pkgs.starship}/bin/starship init bash)"
    '';
  };

  environment = {

    systemPackages = with pkgs; [
      starship
    ];

    etc."starship/starship.toml".source = ./starship.toml;

    shellInit = ''
      export STARSHIP_CONFIG=/etc/starship/starship.toml
    '';
  };
}
