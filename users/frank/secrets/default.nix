{ config
, lib
, self
, ...
}:
### TODO dry-out to lib??
### lib.secrets.registerAdditionalSecrets username secretsR secretsRX secretsRWX

let
  inherit (lib)               genAttrs;
  inherit (config.networking) hostName;

  ### TODO dynamize
  ### TODO enable all defined secrets automatically
  ### TODO must come from variables.users because user on another host can have different
  username           = "frank";
  userSecretNamesR   = [
  ];
  userSecretNamesRX  = [];
  userSecretNamesRWX = [
  ];


  defaultSopsFile = {
    sopsFile = "${self}/secrets/users/${username}/${hostName}/secrets.yaml";
  };

  defaultOpts = defaultSopsFile // {
    owner = config.users.users.${username}.name;
  };

  rxOpts = defaultOpts // {
    mode  = "0500";
  };

  rwxOpts = defaultOpts // {
    mode  = "0700";
  };

  systemSecrets = {
    "${username}/password/hashed" = defaultSopsFile // {
    neededForUsers = true;
    };
  };

  userSecretsR   = genAttrs userSecretNamesR   (_: defaultOpts);
  userSecretsRX  = genAttrs userSecretNamesRX  (_: rxOpts);
  userSecretsRWX = genAttrs userSecretNamesRWX (_: rwxOpts);

  userSecrets    = userSecretsR  // userSecretsRX // userSecretsRWX;

in
{
  sops.secrets  = systemSecrets // userSecrets;
}
