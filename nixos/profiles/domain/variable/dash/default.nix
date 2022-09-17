{ config
, variables
, ...
}:
let
  inherit (variables)         domain;
  inherit (config.networking) hostName;
in
{
  environment.etc."traefik/conf/dashboardVariable.toml".text = import ./dashboard.toml.nix { inherit domain hostName; };
}
