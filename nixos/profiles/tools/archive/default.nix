{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    p7zip                      ### http://p7zip.sourceforge.net/
  ];
}
