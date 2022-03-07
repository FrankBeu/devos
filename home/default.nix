{ self, inputs, ...}:
let
  inherit (inputs) digga nixos nixos-hardware;
in
{
  imports = [ (digga.lib.importExportableModules ./modules) ];
  modules = with inputs; [
    nix-colors.homeManagerModule
  ];
  importables = rec {
    profiles = digga.lib.rakeLeaves ./profiles;
    suites   = with profiles; rec {
      base = [ direnv git ];
    };
  };
  users = {
    nixos = { suites, ... }: { imports = suites.base; };
  }; # digga.lib.importers.rakeLeaves ./users/hm;
}
