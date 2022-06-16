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
        suites.i3 ++
        # suites.debug ++
        [];

        variables = {
          displaymanager = {
            autologin = {
              enabled  = true;
              inherit username;
            };
          };
          budLocalFlakeCloneLocation = budDir;
        };

        ### /home/test/DEVOS
        systemd.tmpfiles.rules = [ ( import ./testPreparation.nix { inherit budDir group self username; } ).tmpfiles ];### KEEP (multiline-)string-import

        home-manager.users.${username} = { profiles, suites, ... }:
        {
          imports = with profiles; [
            dotLocal
          ];
        };

      };
    };

    enableOCR  = false;

    testScript =
      ''
        ${testHelpers}
        start_all()
        ${testScriptBudProfile}
        ${testScriptExternal}
      '';

      name = self.inputs.latest.lib.toUpper name;
  };

  name = with builtins; baseNameOf (toString ./.);
  testScriptBudProfile = (import ../../nixos/profiles/bud/testScript.py.nix {inherit        username;});
  testScriptExternal   = (import ./testScript.py.nix                        {inherit budDir username;});

in
{
  ${name} = mkTest host test;
}
