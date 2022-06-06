{ self, inputs, ...}:
let
  inherit (inputs) digga nixos nixos-hardware;
  inherit (builtins) attrValues;
  inherit (self.lib) mkSuite;
in
{
  hostDefaults = {
    system      = "x86_64-linux";
    channelName = "nixos";
    ### TODO undefined variable 'agenix'
    # channelName = "latest";
    imports     = [ (digga.lib.importExportableModules ./modules) ];
    modules     = with inputs; [
      { lib.our = self.lib; }
      digga.nixosModules.bootstrapIso
      digga.nixosModules.nixConfig
      home.nixosModules.home-manager
      agenix.nixosModules.age
      bud.nixosModules.bud
    ];
  };

  imports = [ (digga.lib.importHosts ../hosts) ];

  hosts   = {
    ### set host specific properties here
    bootstrap = {};
    isoBase   = {};
    mac       = { channelName = "latest"; };
    NixOS     = {
      channelName = "latest";
      tests       = [ digga.lib.allProfilesTest ];
    };
    nuc       = { channelName = "latest"; };
    ryzen     = { channelName = "latest"; };
    vmRyzen   = {};
  };

  importables = rec {
    profiles = digga.lib.rakeLeaves ./profiles // {
      users  = digga.lib.rakeLeaves ../users;
    };
    suites = import ./suites { inherit profiles; };
  };
}
