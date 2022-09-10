{ mkTest
, self
, testHelpers
, ...
}:
let
  host     = self.nixosConfigurations.test;
  username = host.config.variables.testing.user.name;

  test = {
    # extraPythonPackages = p: [];
    nodes = {
      machine = { suites, profiles, variables, ... }:
      {
        imports = with profiles; [
          profiles.tools.serialization.remarshal
        ] ++
        # suites.debug ++
        [];

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

  testScriptExternal = (import ./testScript.py.nix {});

in
{
  ${name} = mkTest host test;
}
