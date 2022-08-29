{ config, pkgs, variables, ... }:

### redirecting:
### http  -> https
### https -> kubes
let domain = variables.domain;
kubeEdgeNodePort-DEV-Http    = 32080;
kubeEdgeNodePort-DEV-HttpS   = 32443;

kubeEdgeNodePort-STAGE-Http  = 31080;
kubeEdgeNodePort-STAGE-HttpS = 31443;

kubeEdgeNodePort-PROD-Http   = 30080;
kubeEdgeNodePort-PROD-HttpS  = 30443;
in
{
  services.caddy = {
    enable = true;
    globalConfig = ''
      auto_https off
    '';
      # auto_https disable_certs

    ### TODO http -> https
    ### TODO ssh via tcp net
    ### TODO wildcard subdomains
    virtualHosts  = {
      # "dev.${domain}" = { ### NOT WORKING
      "http://dev.${domain}" = {
        # serverAliases = [ "dev.local" ];
        extraConfig = ''
          reverse_proxy 127.0.0.1:${toString kubeEdgeNodePort-DEV-Http}
        '';
      };
    };

    virtualHosts  = {
      "http://stage.${domain}" = {
        extraConfig = ''
          reverse_proxy 127.0.0.1:${toString kubeEdgeNodePort-STAGE-Http}
        '';
      };
    };

  };
}
