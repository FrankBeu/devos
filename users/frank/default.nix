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
  ### TODO extract to lib
  imports = [
    ./secrets
  ];

  home-manager.users = { inherit (hmUsers) frank; };

  users.users.frank  = {
    isNormalUser   = true;
    description    = "Frank Beutelschiess";
    uid            = 1428;
    group          = "users";
    shell          = pkgs.zsh;

    passwordFile   = config.sops.secrets."frank/password/hashed".path;
    # hashedPassword = "$6$zFsull/7$I9f/Vorw7AU8uPnJcuIZdhVDh3ogCd6h/D7wsYcA46G1IF8w3Yn79hHU6YiHUKNH3RFTHxfnJwmYTU3TLsIMW/";
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHpiELFqAVRt7V9fFUmem+JA4yIiz0CMNSwPI+i1Bhky frank@lap"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGldXvefZTLktraSKNbNRkhHid/NOM3hckQ7/ibhFr5Z frank@mac"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPi+9lk1riByJQJ8UdUowohjnMffgOYVMwPZf1k+FT/0 frank@nuc"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIE7OMzkeVDgvFNoLnCt11uWDhgudJpFfC+j5QI40sNpE frank@ryzen"
    ];
    extraGroups = [
      "wheel"
      "docker"
      "adbusers"
      "libvirtd"

      config.users.groups.keys.name  ### sops: access secrets as user
    ];
  };
}
