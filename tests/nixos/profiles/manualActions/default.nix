{ mkTest
, self
, testHelpers
, ...
}:
let
  host       = self.nixosConfigurations.test;
  username   = host.config.variables.testing.user.name;
  group      = host.config.users.users.${username}.group;

  test = {
    nodes = {
      machine = { suites, profiles, ... }:
      {
        imports = with profiles; [
          manualActions
        ] ++
        # suites.debug ++
        [];

        variables.manualActions.user.name = username;

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

  testScriptExternal = (import ./testScript.py.nix {inherit group username;});

in
{
  ${name} = mkTest host test;
}
