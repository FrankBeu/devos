{
  services.nginx = {
    enable       = true;
    virtualHosts = {
      "doc.local" = {
        locations."/".proxyPass = "http://127.0.0.1:41503/";

        # serverAliases = ["doc.local"];
      };
    };
  };
}
