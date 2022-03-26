{ self, config, lib, pkgs, ... }:
{
  environment = {
    systemPackages = with pkgs; [
      ranger
    ];

    shellAliases = {
      r = "ranger";
    };

    etc."/ranger".source = ./ranger;

  };
  ### TODO: use bat as highlighter
  ### TODO: global configuration
  ### mans '^FILES' ranger
  ### try to use global configuration for apps used also by root: ranger, bat, vim, ripgrep, zsh??

}
