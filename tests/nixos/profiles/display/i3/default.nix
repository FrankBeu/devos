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
        ];

        variables = {
          displaymanager = {
            autologin = {
              enabled  = true;
              inherit username;
            };
          };
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

  userID = host.config.users.users.${username}.uid;
  testScriptExternal = (import ./testScript.py.nix {inherit userID;});

in
{
  ${name} = mkTest host test;
}
