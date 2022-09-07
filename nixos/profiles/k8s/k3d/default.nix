{ config, pkgs, ...}:
{
  environment.systemPackages = with pkgs; [
    kube3d
  ];

  environment.etc."/docLocal/content/system/k3d.org".source = ./doc.org;

  virtualisation.docker.enable = true;
}
