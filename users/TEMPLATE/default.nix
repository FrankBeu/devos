{ config
, hmUsers
, inputs
, ...
}:
{
  home-manager.users = { inherit (hmUsers) USERNAME; };

  # imports = [
  #   ./secrets
  # ];

  users.users.USERNAME = {
    description  = "default";
    isNormalUser = true;
    extraGroups  = [ "wheel" ];
    uid          = 1000;
    password = "USERNAME"; ### only on NixOS
    # passwordFile = config.sops.secrets."USERNAME/password/hashed".path;
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIE7OMzkeVDgvFNoLnCt11uWDhgudJpFfC+j5QI40sNpE frank@ryzen"
    ];
  };
}
