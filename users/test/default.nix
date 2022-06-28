{ config
, hmUsers
, inputs
, ...
}:
{
  home-manager.users = { inherit (hmUsers) test; };

  imports = [
    ./secrets
  ];

  users.users.test = {
    description  = "testUser";
    isNormalUser = true;
    extraGroups  = [ "wheel" ];
    uid          = 1000;
    ### password = "test"; ### only on test
    passwordFile = config.sops.secrets."test/password/hashed".path;
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIE7OMzkeVDgvFNoLnCt11uWDhgudJpFfC+j5QI40sNpE frank@ryzen"
    ];
  };
}
