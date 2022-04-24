{config, lib, pkgs, ...}:
{
  imports = [
    ./i3statusBar            ### == barista != i3statusRust
  ];

  ### make the configuration-file modular; cf. fcitx
  xdg.configFile."i3/config".text = pkgs.lib.mkDefault( pkgs.lib.mkOrder 1
  ''
    ${(builtins.readFile ./i3/config)}
  '');

  home = {
    file.".nixosInstallation/doc/i3.org".text = pkgs.lib.mkDefault( pkgs.lib.mkAfter ''
      ${(builtins.readFile ./doc.org)}
    '');
  };
}
