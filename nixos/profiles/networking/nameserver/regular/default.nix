{config, ...}:
{
  networking.nameservers = [ "127.0.0.1" ];

  services.coredns = {
    enable = true;
    config = ''
      . {
        ### Cloudflare and Google
        forward . 1.1.1.1 1.0.0.1 8.8.8.8 8.8.4.4
        cache
      }
    '';
    ### enable readiness on localhost:5353/ready
    ### https://coredns.io/plugins/ready/
        # ready localhost:5353
  };
}
