{config, pkgs,  ...}:
{
  home.packages = [ pkgs.vivid ];

  programs.zsh = {
    initExtra = ''
      ${builtins.readFile ./vivid.zsh }
    '';
  };
}
