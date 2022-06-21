{ self, nixosConfig, pkgs, ... }:
{
  ### TODO import in i3 config directly
  xdg.configFile."i3/config".text = pkgs.lib.mkDefault( pkgs.lib.mkOrder 2
  ''
    ${(import
      (builtins.toPath "${self}/hosts/${nixosConfig.networking.hostName}/system/misc/immediate/i3.nix")
      { inherit (nixosConfig) environment; }
    )}'');
}
