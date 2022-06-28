{ self, inputs, ...}:
let
  inherit (inputs) digga nixos nixos-hardware;
  inherit (builtins) attrValues;
  inherit (self.lib) mkSuite;
in
{
  hostDefaults = {
    system      = "x86_64-linux";
    channelName = "latest";
    imports     = [ (digga.lib.importExportableModules ./modules) ];
    modules     = with inputs; [
      { lib.our = self.lib; }
      digga.nixosModules.bootstrapIso
      digga.nixosModules.nixConfig
      home.nixosModules.home-manager
      agenix.nixosModules.age
      bud.nixosModules.bud
      sops-nix.nixosModules.sops
    ];
  };

  imports = [ (digga.lib.importHosts ../hosts) ];

  hosts   = {
    ### set host specific properties here
    bootstrap = { channelName = "nixos"; };
    isoBase   = { channelName = "nixos"; };
    mac       = {};
    NixOS     = {
      # channelName = "latest";
      tests       = [ digga.lib.allProfilesTest ];
    };
    nuc       = {};
    ryzen     = {};
    vmRyzen   = {};
  };

  importables = rec {
    profiles = digga.lib.rakeLeaves ./profiles // {
      users  = digga.lib.rakeLeaves ../users;
    };
    suites = import ./suites { inherit profiles; };
  };
}
