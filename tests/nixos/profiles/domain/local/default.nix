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
          autologin.variable
          domain.local.domain
          domain.local.doc
          networking.nameserver.regular
          services.documentation
          tools.network          ### DEV
        ];

        bud.localFlakeClone               = "/home/${username}/DEVOS"; ### documentation relies on the location
        variables.documentation.user.name = variables.testing.user.name;
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

  testScriptExternal = builtins.readFile ./testScript.py;

in
{
  ${name} = mkTest host test;
}
