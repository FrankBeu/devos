{ config, ... }:
let
  inherit (config.home)
    profileDirectory
    username
  ;
  preamble = (import ./alacritty/alacritty.nix { inherit profileDirectory username; }).content;
in
{
  programs.alacritty = {
    enable   = true;
    #   settings = {
      #     window.dimensions = {lines = 3; columns = 200;};
      #     key_bindings      = [{key  = "K"; mods  = "Control"; chars = "\\x0c";}];}
  };

  xdg.configFile."./alacritty/alacritty.yml".text = ''
    ${preamble}
    ${(builtins.readFile ./alacritty/alacritty.yml)}
  '';

  ### TODO: use nix-colors
  ### theme
  # xdg.configFile."./alacritty/themes/dracula.yaml"             .text = (import ./alacritty/themes/dracula.nix { inherit variables; }).content;
  # # xdg.configFile."./alacritty/themes/gruvboxDarkHard.yaml"   .source = ./alacritty/themes/gruvboxDarkHard.yaml;
  # # xdg.configFile."./alacritty/themes/gruvboxDarkMedium.yaml" .source = ./alacritty/themes/gruvboxDarkMedium.yaml;
  # # xdg.configFile."./alacritty/themes/gruvboxDarkSoft.yaml"   .source = ./alacritty/themes/gruvboxDarkSoft.yaml;
  # # xdg.configFile."./alacritty/themes/gruvboxLightHard.yaml"  .source = ./alacritty/themes/gruvboxLightHard.yaml;
  # # xdg.configFile."./alacritty/themes/gruvboxLightMedium.yaml".source = ./alacritty/themes/gruvboxLightMedium.yaml;
  # # xdg.configFile."./alacritty/themes/gruvboxLightSoft.yaml"  .source = ./alacritty/themes/gruvboxLightSoft.yaml;
  # xdg.configFile."./alacritty/themes/nord.yaml"                .text = (import ./alacritty/themes/nord.nix { inherit variables; }).content;
  # # xdg.configFile."./alacritty/themes/paraisoDark.yaml"       .source = ./alacritty/themes/paraisoDark.yaml;
  # # xdg.configFile."./alacritty/themes/paraisoLight.yaml"      .source = ./alacritty/themes/paraisoLight.yaml;
  # xdg.configFile."./alacritty/themes/solarizedDark.yaml"       .source = ./alacritty/themes/solarizedDark.yaml;
  # # xdg.configFile."./alacritty/themes/solarizedLight.yaml"    .source = ./alacritty/themes/solarizedLight.yaml;
  # xdg.configFile."./alacritty/themes/symSite.yaml"             .text = (import ./alacritty/themes/symSite.nix { inherit variables; }).content;

  ### handlers
  xdg.dataFile."./alacritty/hintHandler/emacsclient"           .source = ./alacritty/hintHandler/emacsclient;
  xdg.dataFile."./alacritty/hintHandler/nixLog"                .source = ./alacritty/hintHandler/nixLog;

  home.shellAliases = {
    ct  = ''echo -e "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"'';  ### ClearTerminal
    t   = ''alacritty &''           ;  ### Terminal
    tlf = ''setterm -linewrap off'' ;  ### TerminalLinewrapofF
    tln = ''setterm -linewrap on''  ;  ### TerminalLinewrapoN
  };
}
### TODO doc
### wrapping
### --wrap never implies pager if line would wrap
### moving to a sufficient big screen prints without pager
