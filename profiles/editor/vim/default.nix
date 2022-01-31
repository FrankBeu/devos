{ self, config, lib, pkgs, ... }:
{
  environment = {
    systemPackages = with pkgs; [
      vim_configurable
    ];

    etc."vimrc".source = ./vimrc;

    shellAliases =
      {
        v = "vim";
      };
  };
}
