{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    qpdf                        ### https://qpdf.sourceforge.io/
  ];
}
