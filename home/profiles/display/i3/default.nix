{ config
, lib
, nixosConfig
, pkgs
, self
, ... }:
{
  imports =
    let hostSpecificTargetFile = "${self}/hosts/${nixosConfig.networking.hostName}/system/misc/immediate/i3.nix"; in
    [
      ./i3statusBar    ### == barista != i3statusRust
    ] ++ lib.optional (builtins.pathExists hostSpecificTargetFile) ./i3/hostSpecific; ### only import if the target-file exists

    home.file.".local/bin/xsd"      .source = ./dotLocal/xsd;            ### bin
    xdg.dataFile."i3/windowToAnchor".source = ./dotLocal/windowToAnchor; ### share

    home.file.".docLocal/content/homemanager/i3.org".text = pkgs.lib.mkDefault( pkgs.lib.mkAfter ''
      ${(builtins.readFile ./i3.org)}
    '');

    xdg.configFile."i3/config".text = pkgs.lib.mkDefault( pkgs.lib.mkOrder 1
    ''
      ${(builtins.readFile ./i3/config)}
      ${(builtins.readFile ./i3/colors/colors.nix)}
      ${(builtins.readFile ./i3/bars/barTop)}
      ${(builtins.readFile ./i3/bars/barBottom)}'');
}
