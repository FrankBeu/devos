{
  services.caddy = {
    enable       = true;
    virtualHosts = {
      "http://doc.local" = {
        extraConfig = ''
          reverse_proxy 127.0.0.1:41503
        '';
      };
    };
  };
}
