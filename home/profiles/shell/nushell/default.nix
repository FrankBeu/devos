{ pkgs , ... }:
{
  home = {
    packages = with pkgs; [
      nushell        ###  https://github.com/nushell/nushell; https://www.nushell.sh/book/
    ];
  };
}
