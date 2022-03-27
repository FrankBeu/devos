{ hmUsers, inputs, ... }:
{
  home-manager.users = { inherit (hmUsers) frank; };

  users.users.frank = {
    ### TODO use sops
    description    = "Frank Beutelschiess";
    hashedPassword = "$6$zFsull/7$I9f/Vorw7AU8uPnJcuIZdhVDh3ogCd6h/D7wsYcA46G1IF8w3Yn79hHU6YiHUKNH3RFTHxfnJwmYTU3TLsIMW/";
    isNormalUser   = true;
    uid            = 1428;
    extraGroups    = [
      "wheel" ### Enable ‘sudo’ for the user.
      "docker"
    ];
    ### TODO if enabled docker : docker
  };
}

### `mkpasswd -m sha-512 PASSWORD`
