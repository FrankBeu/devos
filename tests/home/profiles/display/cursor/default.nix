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
        };


        ### /tmp/golden
        systemd.tmpfiles.rules = [ ( import ./testPreparation.nix ).tmpfiles ];### KEEP (multiline-)string-import

          ### TODO remove the statement if it is not needed
          home-manager.users.${username} = { profiles, suites, ... }:
          {
            imports = with profiles; [
              display.cursor
              display.i3
            ];
          };
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

  hmProfileDir       = host.config.home-manager.users.${username}.home.profileDirectory;
  testScriptExternal = (import ./testScript.py.nix { inherit hmProfileDir username; });

in
{
  ${name} = mkTest host test;
}
