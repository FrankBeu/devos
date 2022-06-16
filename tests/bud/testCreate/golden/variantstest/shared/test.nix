{ mkTest
, name
, self
, testHelpers
### TODO forwarded variantSpecific settings
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
        ### TODO
        ] ++
        # suites.debug ++
        [];

        ### TODO remove the statement and the arg if they are not needed
        # variables. ... = ;

        ### TODO remove the statement if it is not needed. Cf. `man tmpfiles.d`
        # systemd.tmpfiles.rules = [];### KEEP (multiline-)string-import

        ### TODO remove the statement if it is not needed
        # home-manager.users.${username} = { profiles, suites, ... }:
        # {
        #   imports = with profiles; [
        #   ### TODO
        #   ];
        # };

        ### TODO use variantSpecific settings
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

  testScriptExternal = (import ./testScript.py.nix {inherit username;});
in
{
  inherit host test;
}
