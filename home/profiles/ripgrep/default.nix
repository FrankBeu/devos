{ pkgs, ... }:
{
  xdg.configFile."ripgrep/config".source = ./config;
  home = {
    packages = with pkgs; [
      ripgrep-all
      vgrep
    ];

    shellAliases = {
      ### TODO use rg in aliases related to rg and rgal in all listAliases
      rgc = ''rg --max-depth =0'';  ### RG Currentworkgindirectory
      rgp = ''rg -p''            ;  ### RG Pretty
    };
  };
}
