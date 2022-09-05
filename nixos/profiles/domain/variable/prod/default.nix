{ variables, ... }:
let
  domain                      = variables.domain;
  kubeEdgeNodePort-PROD-Http  = 30080;
  kubeEdgeNodePort-PROD-HttpS = 30443;
in
{
  services.coredns = {
    enable = true;
    config = ''
      ${domain} {
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
      "http://${domain}" = {
        extraConfig = ''
          reverse_proxy 127.0.0.1:${toString kubeEdgeNodePort-PROD-Http}
        '';
      };

      "http://*.${domain}" = {
        extraConfig = ''
          reverse_proxy 127.0.0.1:${toString kubeEdgeNodePort-PROD-Http}
        '';
      };
    };
  };
}
