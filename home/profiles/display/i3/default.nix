{config, lib, pkgs, ...}:
{
  imports = [
    ./i3statusBar            ### == barista != i3statusRust
  ];

  home = {
    # file.".config/i3".source   =  ./i3;
    file.".config/i3/config".source   =  ./i3/config;
    # file.".config/i3/config.toml".source   =  ./i3/config.toml;

    file.".nixosInstallation/doc/i3.org".text = pkgs.lib.mkDefault( pkgs.lib.mkAfter ''
      ${(builtins.readFile ./doc.org)}
    '');
  };
}
