{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    zoxide                     ###  cd-shortcuts; https://github.com/ajeetdsouza/zoxide
  ];
}
