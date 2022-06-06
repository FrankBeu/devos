{ config
, hmUsers
, inputs
, lib
, pkgs
, self
, ...
}:
let
  inherit (config.networking) hostName;
in
{
  home-manager.users = { inherit (hmUsers) frank; };

  users.users.frank = {
    ### TODO use sops
    description    = "Frank Beutelschiess";
    hashedPassword = "$6$zFsull/7$I9f/Vorw7AU8uPnJcuIZdhVDh3ogCd6h/D7wsYcA46G1IF8w3Yn79hHU6YiHUKNH3RFTHxfnJwmYTU3TLsIMW/";
    isNormalUser   = true;
    uid            = 1428;
    group          = "users";
    shell          = pkgs.zsh;

    extraGroups = [
      "wheel"
      "docker"
      "adbusers"
      "libvirtd"

    ];
  };
}

### TODO doc
### groups can be set precautionary - they will only be applied, if the actual group exists
### applying userGroups can be tested by logging into a virtualConsole
