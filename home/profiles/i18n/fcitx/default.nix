{ colorscheme
, config
, nixosConfig
, pkgs
, self
, variables
, ...
}:
let
  inherit (self.lib.colorscheme) allColorsInfo;
  inherit (config.colorscheme) colors;
  # colorscheme        = config.colorscheme.colors;
  inherit (config.home) username;
  user = {
    inherit (nixosConfig.users.users.${username}) description;
    inherit (nixosConfig.variables.users.${username}) email;
  };
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
    xdg.configFile."i3/config".text = pkgs.lib.mkDefault( pkgs.lib.mkAfter ''
      #################################################################################################### fcitx5
      exec --no-startup-id fcitx -d
      ##########################################################################################
    '' );
}
