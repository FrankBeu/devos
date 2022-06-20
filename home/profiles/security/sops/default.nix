{ pkgs, ... }:
{
  xdg.dataFile."sops/sopsAge".source = ./sopsAge;

  home = {
    packages = with pkgs; [
      sops                   ### https://github.com/mozilla/sops
      # pinentry-curses      ### TODO implement alt for Age
      # pinentry
    ];

    file.".docLocal/content/homemanager/security.org".text   = pkgs.lib.mkDefault( pkgs.lib.mkAfter ''
      ${(builtins.readFile ./sops.org)}
    '');

    shellAliases = {
      sops = ''$XDG_DATA_HOME/sops/sopsAge'';  ### set EDITOR; wrap sops with keyfile-decryption-request
    };
  };
}
