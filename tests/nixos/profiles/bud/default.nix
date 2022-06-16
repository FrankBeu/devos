{ mkTest
, self
, testHelpers
, ...
}:
let
  host     = self.nixosConfigurations.test;
  username = host.config.variables.testing.user.name;
  group    = host.config.users.users.${username}.group;
  budDir   = "/home/${username}/DEVOS";

  test = {
    nodes = {
      machine = { suites, profiles, variables, ... }:
      {
        imports = with profiles; [
          bud
        ] ++
        # suites.debug ++
        [];

        variables.budLocalFlakeCloneLocation = budDir;

        ### /home/test/DEVOS
        systemd.tmpfiles.rules = [ ( import ./testPreparation.nix { inherit budDir group self username; } ).tmpfiles ];### KEEP (multiline-)string-import
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

  testScriptExternal = (import ./testScript.py.nix {inherit username;});

in
{
  ${name} = mkTest host test;
}
