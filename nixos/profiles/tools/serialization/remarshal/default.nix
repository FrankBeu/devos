{ pkgs, ... }:
{
  environment = {
    systemPackages = with pkgs; [
      remarshal             ### https://github.com/dbohdan/remarshal
    ];
  };
}
