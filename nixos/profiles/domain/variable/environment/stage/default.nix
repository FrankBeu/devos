{ variables, ... }:
let
  inherit (variables) domain;
  ### TODO extract to variables
  ports  = {
    web       = 31080;
    websecure = 31443;
  };
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
  environment.etc."traefik/conf/stage.toml".text = import ./stage.toml.nix { inherit domain ports; };
}
