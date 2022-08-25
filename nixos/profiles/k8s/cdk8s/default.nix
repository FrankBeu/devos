{ config, pkgs, ...}:
{
  environment.systemPackages = with pkgs; [
    # nodePackages_latest.cdk8s-cli
    nodePackages.cdk8s-cli          ### https://cdk8s.io/
  ];
}
