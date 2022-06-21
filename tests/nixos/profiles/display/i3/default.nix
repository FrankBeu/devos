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
          display.i3
          display.manager.lightdm
          services.documentation
        ];

        variables = {
          displaymanager = {
            autologin = {
              enabled  = true;
              inherit username;
            };
          };
          documentation.user.name = username;
        };

        bud.localFlakeClone = "/home/${username}/DEVOS"; ### documentation relies on the location
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

  userID = host.config.users.users.${username}.uid;
  testScriptExternal = (import ./testScript.py.nix {inherit userID;});

in
{
  ${name} = mkTest host test;
}
