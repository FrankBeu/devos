{
  services.coredns = {
    enable = true;
    config = ''
      . {
        ### Cloudflare and Google
        forward . 1.1.1.1 1.0.0.1 8.8.8.8 8.8.4.4
        cache
      }
    '';
  };
}
