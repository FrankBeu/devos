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
        imports = [] ++
          ### TODO
        # suites.debug ++
        [];

        ### TODO remove the statement and the arg if they are not needed
        # variables. ... = ;

        ### TODO remove the statement if it is not needed. Cf. `man tmpfiles.d`
        # systemd.tmpfiles.rules = [];### KEEP (multiline-)string-import

        ### TODO remove the statement if it is not needed
        # home-manager.users.${username} = { profiles, suites, ... }:
        # {
        #   imports = with profiles; [] ++
        #   ### TODO
        #   [];
        # };
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

  testScriptExternal = (import ./testScript.nix).testScript;

in
{
  ${name} = mkTest host test;
}
