{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    procs                      ###  ps-alt; https://github.com/dalance/procs
  ];
}
