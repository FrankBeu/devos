{ lib, pkgs, ... }:
{
  users.users.frank = {
    uid            = 1428;
    hashedPassword = "$6$zFsull/7$I9f/Vorw7AU8uPnJcuIZdhVDh3ogCd6h/D7wsYcA46G1IF8w3Yn79hHU6YiHUKNH3RFTHxfnJwmYTU3TLsIMW/";
    description    = "Frank Beutelschiess";
    isNormalUser   = true;
    extraGroups    = [
      "wheel" ### Enable ‘sudo’ for the user.
      "docker"
    ];
    ### TODO if enabled docker : docker
  };
}

### `mkpasswd -m sha-512 PASSWORD`
