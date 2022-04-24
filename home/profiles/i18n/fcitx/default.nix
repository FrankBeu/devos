{ self
, colorscheme
, config
, pkgs
, variables
, ...
}:
let
  inherit (self.lib.colorscheme) allColorsInfo;
  inherit (config.colorscheme) colors;
  # colorscheme        = config.colorscheme.colors;
  user = variables.mainUser;
in
{
  ### quickPhrase
  xdg.dataFile."fcitx5/data/QuickPhrase.mb".text =
    ''
      ${(import ./fcitx5/local/data/QuickPhrase.mb.nix { inherit user; })}
    '';

    ### theme
    xdg.dataFile."fcitx5/themes/nixColor/assets"    .source = ./fcitx5/local/themes/nixColor/assets;
    xdg.dataFile."fcitx5/themes/nixColor/theme.conf".text   = ''
      ${(import ./fcitx5/local/themes/nixColor/theme.conf.nix { inherit  allColorsInfo colors; })}
    '';

    ### configuration
    xdg.configFile."fcitx5".source = ./fcitx5/config;

    ### start fcitx via i3-config
    xdg.configFile."i3/config".text = pkgs.lib.mkDefault( pkgs.lib.mkOrder 100 ''
      ################################################################################
      ### fcitx5
      exec --no-startup-id fcitx -d
      ################################################################################
    '' );
}
