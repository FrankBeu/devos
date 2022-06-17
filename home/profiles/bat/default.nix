{ config
, nixosConfig
, lib
, pkgs
, ... }:
let
  inherit (lib)                                 mkIf hm;
  inherit (config.home)                         username;
  inherit (nixosConfig.users.users.${username}) group;
in
{
  home = {
    file.".config/bat/config"                   .source = ./bat/config;
    file.".config/bat/syntaxes" = {
      source = ./bat/syntaxes;
      recursive = true;
      onChange = "${pkgs.bat}/bin/bat cache --build";
      ### ./bat/syntaxes contains testsyntax: battestsyntax.sublime-syntax
      ### cannot be created with systemd-tmpfiles
      ### TODO check if it can be created in profile~ and host~tests
    };

    file.".local/bin/tailbat"                   .source = ./dotLocal/tailbat;
    file.".local/bin/btmn"                      .source = ./dotLocal/btmn;

    file.".docLocal/content/homemanager/bat.org".source = ./bat.org;
  };


    ### programs.zsh.shellGlobalAliases is not available in nixos
    ### but the shell has to be enabled globally
    programs.zsh.shellGlobalAliases =  mkIf nixosConfig.programs.zsh.enable {
      BTMN  = ''| bat --wrap never -l man --style changes,header,grid,rule,snip'';  ### BaTMaN              - used for help commands
      BTNX  = ''| bat --wrap never -l nix --style changes,header,grid,rule,snip'';  ### BaTNiX              - colorize nix
      BTNP  = ''| bat --wrap never -l 'Highlight non-printables''                ;  ### BaTNonPrintables
      BTAN  = ''| bat --wrap never -A ''                                         ;  ### BaTANsi             - show colorCodes

      PJSON = ''| prettybat -l json''                                            ;  ### Prettybat JSON      - format and colorize json
      PJNET = ''| prettybat -l jsonnet''                                         ;  ### Prettybat JsonNET   - format and colorize json
      PYAML = ''| prettybat -l yaml''                                            ;  ### Prettybat YAML      - format and colorize yaml
      PTOML = ''| prettybat -l toml''                                            ;  ### Prettybat TOML      - format and colorize toml
      PKOP  = ''| prettybat -l htpasswd''                                        ;  ### Prettybat for KOPia - format and colorize kopia-output ### TODO create specific syntax
    };
}
