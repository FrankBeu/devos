{ ... }:
{
  services.openssh = {
    enable          = true;
    openFirewall    = true;
    permitRootLogin = "yes";
  };

  # networking.firewall = {
  #   ### Open ports in the firewall.
  #   allowedTCPPorts = [ 22 ];
  # };
}
