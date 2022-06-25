{ config, pkgs, lib, ... }:
{

  fonts = {
    enableDefaultFonts = true;
    fontDir.enable     = true;
    fontconfig         = {
      enable             = true;
      includeUserConf    = true;
      allowBitmaps       = false;
      # antialias          = false;
      # hinting.enable     = false;
      # subpixel.lcdfilter = "none";
      defaultFonts = {
        emoji              = [ "Noto Color Emoji" ];
        monospace          = [ "Roboto Mono"      ];
        serif              = [ "Roboto Slab"      ];
      };
    };
    fonts = with pkgs; [
      (nerdfonts.override {
        fonts = [
          # "FiraCode"
          # "DroidSansMono"
          "RobotoMono"
        ];}  ### https://github.com/NixOS/nixpkgs/blob/master/pkgs/data/fonts/nerdfonts/shas.nix
      )
      # emacs-all-the-icons-fonts ### TODO move to emacsFlake if nec
      dejavu_fonts
      fira-code
      fira-code-symbols
      font-awesome_5
      hack-font
      iosevka-bin
      material-icons
      monoid
      noto-fonts
      noto-fonts-cjk
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-emoji
      noto-fonts-extra
      roboto
      roboto-mono
      roboto-slab
    ];
  };
}
### TODO doc
### `fc-list |less -S`
### https://www.freedesktop.org/wiki/Software/fontconfig/
### https://en.wikipedia.org/wiki/Fontconfig
### https://nixos.wiki/wiki/Fonts
