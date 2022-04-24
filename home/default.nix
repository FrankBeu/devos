{ self, inputs, ...}:
let
  inherit (inputs) digga nixos nixos-hardware;
in
{
  imports = [
    (digga.lib.importExportableModules ./modules)
  ];

  modules = with inputs; [
    ### COLORS:
    ### currently only the schemes from nix-colors are used
    ### the module is unused because it does not provide [base10-base17]
    ### TODO: write overlay or align nixos.modules.colorscheme with the types in nix-colors
    ### nix-repl> outputs.homeConfigurationsPortable.x86_64-linux.nixos.options.nix-colors.colorscheme.
    ### nix-colors only provides a module for hm
    ### TODO: check if it is useable in nixosConfig
    # nix-colors.homeManagerModule
    ../nixos/modules/colorscheme
    ../nixos/modules/variables
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
