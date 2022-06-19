{ mkTest
, self
, testHelpers
, ...
}:
let
  host       = self.nixosConfigurations.test;
  username   = host.config.variables.testing.user.name;

  test = {
    nodes = {
      machine = { suites, profiles, ... }:
      {
        imports = with profiles; [
        ] ++
        # suites.debug ++
        [];

        variables.manualActions.user.name = username;

        home-manager.users.${username} = { profiles, suites, ... }:
        {
          imports = with profiles; [
            manualActions
          ];
        };
      };
    };

    enableOCR = true;

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
