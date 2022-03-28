{
  services.caddy = {
    enable = true;
    config = ''
      http://doc.local

      reverse_proxy 127.0.0.1:41503
    '';
  };
}
