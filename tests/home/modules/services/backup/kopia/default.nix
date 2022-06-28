{ mkTest
, self
, testHelpers
, ...
}:
let
  host     = self.nixosConfigurations.test;
  username = host.config.variables.testing.user.name;

  test = {
    nodes = {
      machine = { suites, profiles, variables, ... }:
      {
        imports = with profiles; [
          ( import ./testPreparation/secrets.nix {
            config = host.config;
            inherit  self username;
            } )
        ] ++
        # suites.debug ++
        [];

        # sops.secrets =  {
        #   "kopia/TEST/configFile"      = { owner = username; };
        #   "kopia/TEST/passwordFile"    = { owner = username; };
        #   "kopia/TEST/environmentFile" = { owner = username; };
        # };

        home-manager.users.${username} = { profiles, suites, ... }:
        {
          imports = [
            ( import ./testPreparation/kopia.nix {
              config      = host.config.home-manager.users.${username};
              nixosConfig = host.config;
              inherit       self;
            } )
          ];
        };
      };
    };

    enableOCR  = false;

    testScript =
      ''
        ${testHelpers}
        start_all()
        ${testScriptExternal}
      '';

      name = self.inputs.latest.lib.toUpper name;
  };

  name = with builtins; baseNameOf (toString ./.);

  testScriptExternal = (import ./testScript.py.nix {inherit username;});

in
{
  ${name} = mkTest host test;
}
