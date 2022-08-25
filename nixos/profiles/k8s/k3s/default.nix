{ config, pkgs, ...}:
{
  environment.systemPackages = with pkgs; [
    k3s
  ];

  networking.firewall.allowedTCPPorts = [ 6443 ];
  services.k3s = {
    enable = true;
    role = "server";
    extraFlags = toString [
      "--no-deploy traefik"
      # "--kubelet-arg=v=4" # Optionally add additional args to k3s
    ];
  };
}
