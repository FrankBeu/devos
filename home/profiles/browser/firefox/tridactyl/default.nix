{ config
, pkgs
, ...
}:
{
  home.packages = with pkgs; [
    tridactyl-native
  ];

  programs.firefox.extensions = with pkgs.nur.repos.rycee.firefox-addons; [ tridactyl ];

  home.file.".local/share/tridactyl/native_main.py"         .source = "${pkgs.tridactyl-native}/share/tridactyl/native_main.py";
  home.file.".mozilla/native-messaging-hosts/tridactyl.json".source = "${pkgs.tridactyl-native}/lib/mozilla/native-messaging-hosts/tridactyl.json";
  home.file.".local/bin/trili"                              .source = ./trili;
  home.file.".local/bin/trihi"                              .source = ./trihi;
  home.file.".config/tridactyl/tridactylrc"                 .source = ./tridactylrc;
  home.file.".config/tridactyl/themes/mytheme.css"          .source = ./themes/mytheme.css;
  # TODO BAT
}
