### provides completions for ../../../../home/profiles/shell/zsh/default.nix:1:16
{ pkgs, ... }:
{
  ### make /share available via /run/current-system/sw/share and hmProfileDir/share
  ### needed for completion
  # environment.pathsToLink = [ "/share" ];
  environment.pathsToLink = [
    "/share/zsh"
    "/share/zsh-autosuggestions"
    "/share/zsh-nix-shell"
  ];
}
