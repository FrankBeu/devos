{ self, mkTest, testHelpers, ... }:
let
  host = self.nixosConfigurations.NixOS;

  test = {

    nodes = {
      machine =
        { suites, profiles, ... }: {
          imports = with profiles; [
            display.manager.gdm
            display.gnome
          ];

          variables = {
            autoLogin = true;
          };

          ### golden/gitVersionTarget.png
          # systemd.tmpfiles.rules = [ ( import ./testPreparation.nix ).tmpfiles ];

          # home-manager.users.nixos = { profiles, suites, ... }: {
          #   imports = [
          #     ### TODO
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

  userID = host.config.users.users.${host.config.variables.mainUser.name}.uid;
  testScriptExternal = (import ./testScript.py.nix {inherit userID;});

in
{
  ${name} = mkTest host test;
}
