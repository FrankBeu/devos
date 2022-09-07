{ config, pkgs, ...}:
{
  home = {
    file.".local/bin/karn".source = ./dotLocal/karn;

    packages = with pkgs; [
      yq
    ];
  };

  programs.zsh = {
    initExtra = ''
      compdef kubecolor=kubectl
    '';
    shellGlobalAliases = {
      COYA = ''| yq . -y | bat -plyaml'';### COlorize YAml
    };
  };
}
