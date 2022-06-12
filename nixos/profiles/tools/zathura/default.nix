{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    zathura
  ];

  environment.etc = {
    zathurarc.source = ./zathurarc;
  };
}
