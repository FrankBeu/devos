{ pkgs, ... }:
{
  home.file.".docLocal/content/homemanager/shell.org".text = pkgs.lib.mkDefault( pkgs.lib.mkAfter ''
    ${(builtins.readFile ./doc.org)}
  '');
}
