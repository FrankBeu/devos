{ pkgs, variables, ... }:
{
  ### Enable documentation.service
  systemd.services.documentation = {
    description   = "docService";
    enable        = true;
    serviceConfig = {
      Type       = "simple";
      ExecStart  = "${pkgs.hugo}/bin/hugo serve -p 41503 -s /etc/docLocal";

      ExecReload = "${pkgs.procps}/bin/pkill -HUP     $MAINPID";
      ExecStop   = "${pkgs.procps}/bin/pkill -SIGTERM $MAINPID";

      Restart    = "on-failure";
      RestartSec = 1;
    };
    wantedBy      = [ "default.target" ];
  };

  ### create repository
  systemd.tmpfiles.rules = let
    name  = variables.mainUser.name;
    group = variables.mainUser.group;
  in
  [
    "d  /home/${name}/.docLocal                      0755    ${name}  ${group}  -   -"
    "d  /home/${name}/.docLocal/content              0755    ${name}  ${group}  -   -"
    "d  /home/${name}/.docLocal/content/homemanager  0755    ${name}  ${group}  -   -"
    "L+ /etc/docLocal/content/homemanager            -       -        -         -   /home/${name}/.docLocal/content/homemanager"

    "L+ /etc/docLocal/archetypes                     -       -        -         -   ${../../../../doc/docLocal/archetypes}"
    "L+ /etc/docLocal/themes                         -       -        -         -   ${../../../../doc/docLocal/themes}"
    "L+ /etc/docLocal/config.toml                    -       -        -         -   ${../../../../doc/docLocal/config.toml}"
  ];

  ### global/documentation
  environment.etc."/docLocal/content/global/documentation.org".source = ./documentation.org;

  ### categories
  environment.etc."/docLocal/content/global.org"              .source = ./content/global.org;
  environment.etc."/docLocal/content/home-manager.org"        .source = ./content/home-manager.org;
  environment.etc."/docLocal/content/system.org"              .source = ./content/system.org;

  ### homepage
  environment.etc."/docLocal/content/home/index.org"          .source = ./content/home/index.org;

  ### colors
  ### TODO: if not variables fixedColors = true;
  ### TODO: make icon svg with dynamic color support
  # environment.etc."/docLocal/themes/theme/src/colors.scss"    .source = (import ./colors/colors.scss.nix) {TODO: colorscheme};

  ### TODO: check all available pages visually after graphical+browser
  ### TODO: documentation
}
