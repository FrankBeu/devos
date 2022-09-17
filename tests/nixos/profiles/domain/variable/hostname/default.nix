{ mkTest
, self
, testHelpers
, ...
}:
let
  host       = self.nixosConfigurations.test;
  username   = host.config.variables.testing.user.name;
  hostName   = host.config.networking.hostName;
  domain = "domain.test";


  test = {
    nodes = {
      machine = { suites, profiles, variables, ... }:
      {
        imports = [
          profiles.networking.nameserver.regular
          profiles.domain.server

          profiles.tools.network          ### DEV

          profiles.domain.variable.hostname
        ] ++
        # suites.debug ++
        [];

        variables.domain = domain;

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

  testScriptExternal = (import ./testScript.py.nix {inherit domain hostName;});

in
{
  ${name} = mkTest host test;
}
