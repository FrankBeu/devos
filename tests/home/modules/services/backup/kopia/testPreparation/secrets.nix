{ config
, self
, username
, ...
}:

let
  inherit (config.networking) hostName;
  sopsFile = "${self}/secrets/users/${username}/${hostName}/secrets.yaml";
  owner    = config.users.users.${username}.name;
in

{
  sops.secrets =  {
    "kopia/TEST/passwordFile"    = { inherit sopsFile owner; };
    "kopia/TEST/environmentFile" = { inherit sopsFile owner; };
  };
}
