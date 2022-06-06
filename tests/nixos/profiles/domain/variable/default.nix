{ mkTest
, self
, testHelpers
, ...
}:
let
  host       = self.nixosConfigurations.test;
  username   = host.config.variables.testing.user.name;
  domainName = "example.com";

  test = {
    nodes = {
      machine = { suites, profiles, variables, ... }:
      {
        imports = with profiles; [
          autologin.variable
          domain.variable
          domain.server
          networking.nameserver.regular
          tools.network                  ### DEV
        ];

        variables.domain = domainName;
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

  testScriptExternal = (import ./testScript.py.nix {inherit domainName;});

in
{
  ${name} = mkTest host test;
}
