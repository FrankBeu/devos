{ config
, variables
, ...
}:
let
  inherit (config.networking) hostName;
  inherit (variables)         domain;
in
{
  services.coredns = {
    enable = true;
    config = ''
      ${hostName}.${domain} {
        template IN A  {
          answer "{{ .Name }} 0 IN A 127.0.0.1"
        }
      }
    '';
  };
}
