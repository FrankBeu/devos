{ self, config, lib, pkgs, ... }:
{
  environment = {
    systemPackages = with pkgs; [
      ranger
      pistol
      ueberzug
      ffmpeg
    ];

    shellAliases = {
      r  = "ranger";
    };

    etc."/ranger".source = ./ranger;

  };
  ### TODO: use bat as highlighter
  ### TODO: doc global configuration
  ### mans '^FILES' ranger
  ### try to use global configuration for apps used also by root: ranger, bat, vim, ripgrep, zsh??

  ### TODO documentation
  ### ranger uses terminal colors
  ### https://github.com/ranger/ranger/blob/master/doc/colorschemes.md
}
