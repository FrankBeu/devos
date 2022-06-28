{ config
, self
, ...
}:
let
  inherit (config.networking) hostName;
in
{
  ### KEEP: USERNAME in secret is needed in order to avoid collisions
  sops.secrets."root/password/hashed" = {
    format         = "yaml";
    sopsFile       = "${self}/secrets/users/root/${hostName}/secrets.yaml";
    neededForUsers = true;
  };

  users.users.root = {
    ### password = "root"; ### only on test
    passwordFile = config.sops.secrets."root/password/hashed".path;
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIM9/istIdrLtlvJXpU9nizspJ6knqO6uew9UDNy0kkOF (none)" ### frank via gpg, ssh-copy-id
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIE7OMzkeVDgvFNoLnCt11uWDhgudJpFfC+j5QI40sNpE frank@ryzen"
    ];
  };
}
