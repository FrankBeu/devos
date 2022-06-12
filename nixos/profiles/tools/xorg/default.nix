{ pkgs, ... }:
{
  environment = {
    systemPackages = with pkgs.xorg; [
      xev
    ];

    shellAliases = {
      xevk = "xev -event keyboard | rg '(keycode|keysym)'";
    };
  };
}
