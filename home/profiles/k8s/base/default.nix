{ config, pkgs, ...}:
{
  home.file.".local/bin/karn".source = ./dotLocal/karn;
  programs.zsh = {
    initExtra = ''
      compdef kubecolor=kubectl
    '';
    ### TODO check if COYA is made redundant by PYML
    shellGlobalAliases = {
      COYA = ''| yq . -y |cat -plyaml'';  ### COlorize YAml
    };
  };
}
