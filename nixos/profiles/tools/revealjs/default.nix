{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    revealjs
  ];

  environment.pathsToLink = [
    "/share/revealjs"
  ];
}
