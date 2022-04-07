{ self, mkTest, testHelpers, ... }:
let
  host = self.nixosConfigurations.NixOS;

  test = {

    nodes = {
      machine =
        { suites, profiles, ... }: {
          imports = with profiles; [
            display.i3
            display.manager.lightdm
          ];

          variables = {
            autoLogin = true;
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

  userID = host.config.users.users.${host.config.variables.mainUser.name}.uid;
  testScriptExternal = (import ./testScript.py.nix {inherit userID;});

in
{
  ${name} = mkTest host test;
}
