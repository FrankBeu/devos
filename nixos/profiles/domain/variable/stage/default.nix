{ variables, ... }:
let
  domain                       = variables.domain;
  kubeEdgeNodePort-STAGE-Http  = 31080;
  kubeEdgeNodePort-STAGE-HttpS = 31443;
in
{
  services.coredns = {
    enable = true;
    config = ''
      stage.${domain} {
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
      "http://stage.${domain}" = {
        extraConfig = ''
          reverse_proxy 127.0.0.1:${toString kubeEdgeNodePort-STAGE-Http}
        '';
      };

      "http://*.stage.${domain}" = {
        extraConfig = ''
          reverse_proxy 127.0.0.1:${toString kubeEdgeNodePort-STAGE-Http}
        '';
      };
    };
  };
}
