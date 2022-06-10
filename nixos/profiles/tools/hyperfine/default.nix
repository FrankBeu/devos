{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    hyperfine                  ###  benchmarks; https://github.com/sharkdp/hyperfine
  ];
}
