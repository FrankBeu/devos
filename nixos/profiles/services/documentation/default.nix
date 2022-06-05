{ self, config, pkgs, variables, ... }:
{
  ### ENABLE DOCUMENTATION.SERVICE
  systemd.services.documentation = {
    description   = "docService";
    enable        = true;
    serviceConfig = {
      Type       = "simple";
      ExecStart  = "${pkgs.hugo}/bin/hugo serve -p 41503 -s /etc/docLocal";

      ExecReload = "${pkgs.procps}/bin/pkill -HUP     $MAINPID";
      ExecStop   = "${pkgs.procps}/bin/pkill -SIGTERM $MAINPID";

      # Restart    = "on-failure";
      Restart    = "always";
      RestartSec = 1;
    };
    wantedBy      = [ "default.target" ];
  };

  ### BASE-STRUCTURE
  systemd.tmpfiles.rules = let
    username = variables.documentation.user.name;
    group    = config.users.users.${username}.group;
  in
  [
    "d  /home/${username}/.docLocal                      0755    ${username}  ${group}  -   -"
    "d  /home/${username}/.docLocal/content              0755    ${username}  ${group}  -   -"
    "d  /home/${username}/.docLocal/content/homemanager  0755    ${username}  ${group}  -   -"
    "L+ /etc/docLocal/content/homemanager                -       -            -         -   /home/${username}/.docLocal/content/homemanager"

    "L+ /etc/docLocal/archetypes                         -       -            -         -   ${../../../../doc/docLocal/archetypes}"
    "L+ /etc/docLocal/themes                             -       -            -         -   ${../../../../doc/docLocal/themes}"

    "L+ /etc/docLocal/config.toml                        -       -            -         -   ${../../../../doc/docLocal/config.toml}"
  ];

  ### CATEGORIES
  environment.etc."/docLocal/content/global.org"              .source = ./content/global.org;
  environment.etc."/docLocal/content/home-manager.org"        .source = ./content/home-manager.org;
  environment.etc."/docLocal/content/structural.org"          .source = ./content/structural.org;
  environment.etc."/docLocal/content/system.org"              .source = ./content/system.org;

  ### CONTENT

  ### HOMEPAGE
  environment.etc."/docLocal/content/home/index.org"          .source = ./content/home/index.org;
  ### GLOBAL
  environment.etc."/docLocal/content/global/README.org"       .text   = ''
    ${(builtins.readFile ./header/readme.nix)}
    ${(builtins.readFile (self + "/README.org"))}
  '';
  environment.etc."/docLocal/content/global/manualActions.org".source = ./content/global/manualActions.org;                                    ###  30
  environment.etc."/docLocal/content/global/workflows.org"    .source = ./content/global/workflows.org;                                        ###  40
  ### STRUCTURAL
  environment.etc."/docLocal/content/structural/doc.org"      .text   = (import "${self}/doc/documentation.org.nix"      { inherit config; }); ###  50
  environment.etc."/docLocal/content/structural/home.org"     .text   = (import "${self}/home/documentation.org.nix"     { inherit config; }); ###  60 != doc.local/home
  environment.etc."/docLocal/content/structural/hosts.org"    .text   = (import "${self}/hosts/documentation.org.nix"    { inherit config; }); ###  70
  environment.etc."/docLocal/content/structural/lib.org"      .text   = (import "${self}/lib/documentation.org.nix"      { inherit config; }); ###  80
  environment.etc."/docLocal/content/structural/nixos.org"    .text   = (import "${self}/nixos/documentation.org.nix"    { inherit config; }); ###  90
  environment.etc."/docLocal/content/structural/overlays.org" .text   = (import "${self}/overlays/documentation.org.nix" { inherit config; }); ### 100
  environment.etc."/docLocal/content/structural/pkgs.org"     .text   = (import "${self}/pkgs/documentation.org.nix"     { inherit config; }); ### 110
  environment.etc."/docLocal/content/structural/secrets.org"  .text   = (import "${self}/secrets/documentation.org.nix"  { inherit config; }); ### 120
  environment.etc."/docLocal/content/structural/shell.org"    .text   = (import "${self}/shell/documentation.org.nix"    { inherit config; }); ### 130
  environment.etc."/docLocal/content/structural/testing.org"  .text   = (import "${self}/tests/documentation.org.nix"    { inherit config; }); ### 140
  environment.etc."/docLocal/content/structural/users.org"    .text   = (import "${self}/users/documentation.org.nix"    { inherit config; }); ### 150

  ### SYSTEM
  environment.etc."/docLocal/content/system/mounts.org"       .source = ./content/system/mounts.org;
  ### BASE-FILES FOR DOCUMENTATION-ATTACHMENTS
  environment.etc."/docLocal/content/system/tools.org"        .text = pkgs.lib.mkDefault( pkgs.lib.mkOrder 1 ''
    ${(builtins.readFile ../../tools/tools.org)}
  '');


  ### colors
  ### TODO use ./colors - currently colors are used from theme
  ### TODO: if not variables fixedColors = true;
  ### TODO: make icon svg with dynamic color support
  ### only theme/{layouts,static} are needed (cannot be symlinks!?!)
  ### disable "L+ /etc/docLocal/themes - - - - ${../../../../doc/docLocal/themes}"
  # environment.etc."/docLocal/themes/theme"                   .source = ../../../../doc/docLocal/themes/theme;
  # environment.etc."/docLocal/themes/theme/src/colors.scss"   .text = (import ./colors/colors.scss.nix {colorscheme = {grey = "777777";};}).colors;
  ### needs build-step for scss->css:
  ### package: theme; sources; patch colors.scss from colors.scss.nix {inherit colorscheme;}; build; take {layout,static}

  ### TODO: AFTER GRAPHICAL+BROWSER:
  ### TODO: check all available pages visually
  ### TODO: check if dynamic colors have to be tweaked (mapped??)
  ### TODO: documentation
}
