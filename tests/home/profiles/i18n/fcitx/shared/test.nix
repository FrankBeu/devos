{ self, mkTest, testHelpers, name, colorSchemeName, testPreparationPath, ... }:
let
  host = self.nixosConfigurations.NixOS;

  test = {
    nodes = {
      machine =
        { suites, profiles, ... }: {
          imports = with profiles; [
            i18n.fcitx
            alacritty
          ] ++ suites.i3;

          variables.autoLogin = true;

          systemd.tmpfiles.rules = [ ( import testPreparationPath ).tmpfiles ];

          home-manager.users.nixos = { profiles, suites, ... }: {
            imports = with profiles; [
              i18n.fcitx
              display.i3
              alacritty
            ];

            variables.currentColorSchemeName = colorSchemeName;
          };

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

  ### the nixos-test is not used here, because i3 will start/test the service anyway
  username = host.config.variables.mainUser.name;
  testScriptExternal = (import ./testScript.py.nix {inherit username;});
in
{
  inherit host test;
}
