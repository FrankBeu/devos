{ self, config, lib, pkgs, ... }:
{
  environment = {
    systemPackages = with pkgs; [
      ranger
    ];

    shellAliases =
      {
        r = "ranger";
      };
  };
}
