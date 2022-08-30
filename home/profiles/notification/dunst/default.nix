{ config
, lib
, nixosConfig
, pkgs
, variables
, ...
}:
{
  home.packages = with pkgs; [
    libnotify  ### notify-send
  ];

  xdg.configFile."i3/config".text = pkgs.lib.mkDefault( pkgs.lib.mkAfter ''
    ${(import ./i3/additional.nix )}
  '' );

  services.dunst = {
    enable    = true;
    # settings  = pkgs.callPackage (import ./dunst/dunstrc.nix) {};
    settings  = (import ./dunst/dunstrc.nix { inherit pkgs; });
    # iconTheme = {
      #   # name = "hicolor";
      #   name = "Adwaita";
      #   # package = (build of hicolor-icon-theme-0.17);
      #   package = pkgs.gnome3.adwaita-icon-theme;
      #   size = "32x32";
      #   # Configuration written to ~/.config/dunst/dunstrc
      # };
  };

  programs.zsh.shellGlobalAliases =  lib.mkIf nixosConfig.programs.zsh.enable {
    FIN  = ''&& (){ dunstify -u low "''${@}" finished. }''; ### FINished          [[<OPTIONS>]<MESSAGE>] - notify when preceding command has finished
    FINC = ''&& (){ dunstify -u low "''${@}" finished. }''; ### FINished-Critical [[<OPTIONS>]<MESSAGE>] - notify when preceding command has finished with sticky notification
  };

}
### TODO cleanup
### TODO colors
### TODO doc
###      https://wiki.archlinux.org/title/Dunst
###      https://github.com/0Karakurt0/i3-vimonised/blob/master/config
###      FINISHED + BELL
