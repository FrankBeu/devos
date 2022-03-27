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
    suites   = import ./suites { inherit profiles; };
  };

  users = {
    # nixos = { suites, ... }: { imports = suites.base; };
    frank = { suites, ... }: {};
    nixos = { suites, ... }: {};
  };
}
