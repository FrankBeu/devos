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
          display.manager.lightdm
          display.i3
        ];

        variables = {
          displaymanager = {
            autologin = {
              enabled  = true;
              inherit username;
            };
          };
        };

        ### golden/gitVersionTarget.png
        systemd.tmpfiles.rules = [ ( import ./testPreparation.nix ).tmpfiles ];

        home-manager.users.${username} = { profiles, suites, ... }:
        {
          imports = [
            profiles.display.i3
          ];
        };
      };
    };

    enableOCR = true;

    testScript =
      ''
        ${testHelpers}
        start_all()
        ${testScriptNixos}
        ${testScriptExternal}
      '';

      name = self.inputs.latest.lib.toUpper name;
  };

  name = with builtins; baseNameOf (toString ./.);

  userID   = host.config.users.users.${username}.uid;
  testScriptNixos    = (import  ../../../../nixos/profiles/display/i3/testScript.py.nix { inherit userID; });
  testScriptExternal = (import ./testScript.py.nix {inherit username;});

in
{
  ${name} = mkTest host test;
}
