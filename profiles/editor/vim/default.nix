{ self, config, lib, pkgs, ... }:
{
  environment = {
    systemPackages = with pkgs; [
      vim_configurable
    ];

    etc."vimrc".source = ./vimrc;

    # variables.EDITOR = "vim";

    shellAliases =
      {
        v = "vim";
      };
  };
}
