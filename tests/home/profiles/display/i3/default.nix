{ self, mkTest, testHelpers, ... }:
let
  host = self.nixosConfigurations.NixOS;

  test = {

    nodes = {
      machine =
        { suites, profiles, ... }: {
          imports = with profiles; [
            display.manager.lightdm
            display.i3
          ];

          variables = {
            autoLogin = true;
          };

          ### golden/gitVersionTarget.png
          systemd.tmpfiles.rules = [ ( import ./testPreparation.nix ).tmpfiles ];

          home-manager.users.nixos = { profiles, suites, ... }: {
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

  username = host.config.variables.mainUser.name;
  userID   = host.config.users.users.${host.config.variables.mainUser.name}.uid;
  testScriptNixos    = (import  ../../../../nixos/profiles/display/i3/testScript.py.nix { inherit userID; });
  testScriptExternal = (import ./testScript.py.nix {inherit username;});

in
{
  ${name} = mkTest host test;
}
