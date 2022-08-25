{ config, pkgs, ...}:
{
  environment.systemPackages = with pkgs; [
    kube3d
  ];

  # networking.domain = "thesym.site";

  environment.etc."/docLocal/content/system/k3d.org".source = ./doc.org;

  virtualisation.docker.enable = true;
}
