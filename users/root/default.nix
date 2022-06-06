# recommend using `hashedPassword`
{ config
, self
, ...
}:
let
  inherit (config.networking) hostName;
in
{
  ### TODO use sops
  users.users.root = {
    password = "root";
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIM9/istIdrLtlvJXpU9nizspJ6knqO6uew9UDNy0kkOF (none)" ### frank via gpg, ssh-copy-id
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIE7OMzkeVDgvFNoLnCt11uWDhgudJpFfC+j5QI40sNpE frank@ryzen"
    ];
  };
}
### TODO doc
