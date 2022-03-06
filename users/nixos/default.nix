{ hmUsers, inputs, ... }:
{
  home-manager.users = { inherit (hmUsers) nixos; };

  users.users.nixos = {
    ### TODO use sops
    password     = "nixos";
    description  = "default";
    isNormalUser = true;
    extraGroups  = [ "wheel" ];
  };
}
