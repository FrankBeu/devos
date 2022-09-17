{ variables, ... }:
let
  inherit (variables) domain;
  ### TODO extract to variables
  ports  = {
    web       = 30080;
    websecure = 30443;
  };
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
  environment.etc."traefik/conf/prod.toml".text = import ./prod.toml.nix { inherit domain ports; };
}
