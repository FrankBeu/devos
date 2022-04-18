{
  services.caddy = {
    enable = true;
    extraConfig = ''
      http://doc.local

      reverse_proxy 127.0.0.1:41503
    '';
  };
}
