{ colorSchemeName
, mkTest
, name
, self
, testHelpers
, testPreparationPath
, ...
}:
let
  host     = self.nixosConfigurations.NixOS;
  username = host.config.variables.testing.user.name;

  test = {
    nodes = {
      machine = { suites, profiles, variables, ... }:
      {
        imports = with profiles; [
          i18n.fcitx
          alacritty
        ] ++ suites.i3;

        variables = {
          displaymanager = {
            autologin = {
              enabled  = true;
              inherit username;
            };
          };
        };

        systemd.tmpfiles.rules = [ ( import testPreparationPath ).tmpfiles ];

        home-manager.users.${username} = { profiles, suites, ... }:
        {
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
  testScriptExternal = (import ./testScript.py.nix {inherit username;});
in
{
  inherit host test;
}
