{config, pkgs, ...}:
let
  inherit (config.home) username;
in
{
  home = {
    packages = with pkgs; [
      pandoc        ### dep of pipefox
    ];

    sessionPath = [
      "$HOME/.local/bin"
    ];

    file = {
      ### BIN
      ".local/bin" = {
        source    = ./bin;
        recursive = true;
      };
    };

    ### DOC
    file.".docLocal/content/homemanager/dotlocal.org".text = pkgs.lib.mkDefault( pkgs.lib.mkAfter ''
      ${(builtins.readFile ./dotLocal.org)}
    '');

    shellAliases = {
      scang = ''scan Gray  ''       ;### SCANGray
      scanc = ''scan Color ''       ;### SCANColor
      rscc  = ''checkoutNthCommit '';### ReadtheSourceCheckoutnthCommit
    };
  };

  ### STATE
  systemd.user.tmpfiles.rules = [
    "D /home/${username}/.local/state - - - - "
  ];

  ### SHARED
  ### cannot map the folder because other apps will use the folder, too
  xdg = {
    dataFile."shellColorDefinitions".source = "${pkgs.shellColorDefinitions}/bin/shellColorDefinitions";
    dataFile."styles/styles.css"    .source = ./share/styles/styles.css;
    dataFile."nixify"               .source = ./share/nixify;
  };
}
### TODO distribute files which are needed by other profiles (FUNDUS)
### TODO write overview-tool
### TODO write template-tool - in order to be able to parse the documentation
### TODO doc
### TODO multiple modes zsh + yaml
### TODO yaml will be parsed by `dotLocalInfo`
### TODO update all scripts to yamlDoc
