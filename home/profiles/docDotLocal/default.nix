{ config, pkgs, variables, ... }:
let
  inherit (config.home) username;
  defaultBrowser = variables.users.${username}.defaultBrowser;
in
{
  ### TODO if has i3
  xdg.configFile."i3/config".text = pkgs.lib.mkDefault( pkgs.lib.mkAfter ''
    ${(import ./i3/additional.nix { inherit defaultBrowser; } )}
  '' );

  ### BASE-FILES FOR DOCUMENTATION-ATTACHMENTS
  home.file = {
    ".docLocal/content/homemanager/backup.org".text = pkgs.lib.mkDefault(pkgs.lib.mkOrder 1 ''
      ${(builtins.readFile ../backup/backup.org)}
    '');
    ".docLocal/content/homemanager/security.org".text = pkgs.lib.mkDefault(pkgs.lib.mkOrder 1 ''
      ${(builtins.readFile ../security/security.org)}
    '');
    ".docLocal/content/homemanager/shell.org".text = pkgs.lib.mkDefault(pkgs.lib.mkOrder 1 ''
      ${(builtins.readFile ../shell/shell.org)}
    '');
  };
}
