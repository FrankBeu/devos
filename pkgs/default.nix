{ inputs }:

final: prev:
{
  ### KEEP SOURCES FIRST,
  ### SOURCES-OVERLAY FROM NVFETCHER
  sources               =  prev.callPackage (import ./_sources/generated.nix) {};


  ### THEN, CALL PACKAGES WITH `FINAL.CALLPACKAGE`
  ### LOCALLY DEFINED PACKAGES
  i3statusBar           = final.callPackage         ./i3statusBar             {};
  shellColorDefinitions = final.callPackage         ./shellColorDefinitions   {};
  riv                   = final.callPackage         ./riv                     {};

  ### TEMPORARILY
  starship              = final.callPackage         ./starship                {};


  ### PACKAGES PROVIDED BY FLAKES
  inherit (inputs.rnix-lsp.packages."${prev.system}") rnix-lsp;
}
