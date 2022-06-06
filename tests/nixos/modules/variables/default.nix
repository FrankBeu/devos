{ mkTest
, self
, ...
}:
let
  host     = self.nixosConfigurations.NixOS;
  username = host.config.variables.testing.user.name;

  test = {
    nodes = {
      machine = { suites, profiles, variables, ... }:
      {

        ### variablesTest{Target,Actual}
        systemd.tmpfiles.rules = [ ( import ./testPreparation.nix { inherit variables; } ).tmpfiles ];

        home-manager.users.${username} = { profiles, suites, variables, ... }:
        {
          imports = [];

          ### variablesTestActual
          home.file."tmp/variablesTestActual".text = ( import ./testPreparationHome.nix { inherit variables; } );
        };
      };
    };

    enableOCR  = false;

    testScript =
      ''
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
