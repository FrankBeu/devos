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
      machine = { suites, profiles, ... }:
      {
        imports = with profiles; [
          ### TODO
        ] ++
        # suites.debug ++
        [];

        ### TODO remove the statement and the arg if they are not needed
        # variables. ... = ;

        ### /tmp/golden
        systemd.tmpfiles.rules = [ ( import ./testPreparation.nix ).tmpfiles ];### KEEP (multiline-)string-import

        ### TODO remove the statement if it is not needed
        # home-manager.users.${username} = { profiles, suites, ... }:
        # {
        #   imports = with profiles; [
        #   ### TODO
        #   ];
        # };
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

  ### TODO activate one and remove the other statement the corresponding file:
  # testScriptExternal = builtins.readFile ./testScript.py;
  # testScriptExternal = (import ./testScript.py.nix {inherit username;});

in
{
  ${name} = mkTest host test;
}
