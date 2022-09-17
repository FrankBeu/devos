{ variables, ... }:
let
  inherit (variables) domain;
  ### TODO extract to variables
  ports  = {
    web       = 32080;
    websecure = 32443;
  };
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
  environment.etc."traefik/conf/dev.toml".text = import ./dev.toml.nix { inherit domain ports; };
}
