### TODO: check if coreDNS can be enabled to do secure queries
### TODO: else: fix
### TODO:       IDEA: chain network:127...; coreDNS:{local,DOMAIN,externalForwardToDnscrypt}
### TODO:       IDEA: chain network:127...; dnsCrypt:{external,localCoreDnsSecure}
###
##
# * dns
#
# {
#   services.coredns.enable = true;
#   services.coredns.config =
#     ''
#       . {
#         ### Cloudflare and Google
#         forward . 1.1.1.1 1.0.0.1 8.8.8.8 8.8.4.4
#         cache
#       }
#     '';
# }
{ lib, pkgs, ...}:
{
  networking = {
    nameservers = [ "127.0.0.1" "::1" ];
    resolvconf.enable = pkgs.lib.mkForce false; ### TODO find out why
    ### If using dhcpcd:
    dhcpcd.extraConfig = "nohook resolv.conf";
    ### If using NetworkManager:
    networkmanager.dns = "none";
  };

  ### Make sure you don't have services.resolved.enable on.
  services.resolved.enable = false;

  services.dnscrypt-proxy2 = {
    enable = true;
    settings = {
      ipv6_servers = true;
      require_dnssec = true;

      sources.public-resolvers = {
        urls = [
          "https://raw.githubusercontent.com/DNSCrypt/dnscrypt-resolvers/master/v3/public-resolvers.md"
          "https://download.dnscrypt.info/resolvers-list/v3/public-resolvers.md"
        ];
        cache_file = "/var/lib/dnscrypt-proxy2/public-resolvers.md";
        minisign_key = "RWQf6LRCGA9i53mlYecO4IzT51TGPpvWucNSCh1CBM0QTaLn73Y7GFO3";
      };

      # You can choose a specific set of servers from https://github.com/DNSCrypt/dnscrypt-resolvers/blob/master/v3/public-resolvers.md
      # server_names = [ ... ];

      ### MultDNS
      listen_addresses = [ "[::1]:51" ];


    };
  };
  ### MultDNS
  # Forward loopback traffic on port 53 to dnscrypt-proxy2.
  networking.firewall.extraCommands = ''
    ip6tables --table nat --flush OUTPUT
    ${lib.flip (lib.concatMapStringsSep "\n") [ "udp" "tcp" ] (proto: ''
      ip6tables --table nat --append OUTPUT \
        --protocol ${proto} --destination ::1 --destination-port 53 \
        --jump REDIRECT --to-ports 51
    '')}
  '';

  # systemd.services.dnscrypt-proxy2.serviceConfig = {
  #   StateDirectory = "dnscrypt-proxy2";
  # };
}
