{ variables, ... }:
let
  domain                     = variables.domain;
  kubeEdgeNodePort-DEV-Http  = 32080;
  kubeEdgeNodePort-DEV-HttpS = 32443;
in
{
  services.coredns = {
    enable = true;
    config = ''
      dev.${domain} {
        template IN A  {
            answer "{{ .Name }} 0 IN A 127.0.0.1"
        }
      }
    '';
  };

  services.caddy = {
    enable = true;
    globalConfig = ''
      auto_https off
    '';
      # auto_https disable_certs

    ### TODO http -> https
    ### TODO ssh via tcp net
    virtualHosts  = {
      # "dev.${domain}" = { ### NOT WORKING
      "http://dev.${domain}" = {
        # serverAliases = [ "dev.local" ];
        extraConfig = ''
          reverse_proxy 127.0.0.1:${toString kubeEdgeNodePort-DEV-Http}
        '';
      };

      "http://*.dev.${domain}" = {
        extraConfig = ''
          reverse_proxy 127.0.0.1:${toString kubeEdgeNodePort-DEV-Http}
        '';
      };
    };
  };
}
