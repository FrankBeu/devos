{ pkgs,  ... }:
{
  home.packages = [ pkgs.cod ];

  programs.zsh = {
    initExtra = ''
      ${builtins.readFile ./cod.zsh }
    '';
  };
}
