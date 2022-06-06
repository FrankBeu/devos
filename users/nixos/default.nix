{ config
, hmUsers
, inputs
, ...
}:
{
  home-manager.users = { inherit (hmUsers) nixos; };

  users.users.nixos = {
    ### TODO use sops
    password     = "nixos";
    description  = "default";
    isNormalUser = true;
    extraGroups  = [ "wheel" ];
    uid          = 1000;
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIE7OMzkeVDgvFNoLnCt11uWDhgudJpFfC+j5QI40sNpE frank@ryzen"
    ];
  };
}
