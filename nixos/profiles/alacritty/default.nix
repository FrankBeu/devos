{ pkgs, ... }:
{
  environment = {
    systemPackages = with pkgs; [
      alacritty
    ];
    ### configuration: home.profiles.alacritty
  };
}
