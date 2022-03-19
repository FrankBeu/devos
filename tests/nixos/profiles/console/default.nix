{ self, mkTest, testHelpers, ... }:
let
  host = self.nixosConfigurations.NixOS;

  test = {
    nodes = {
      machine =
        { suites, profiles, ... }: {
          imports = [ profiles.console ];

          services.getty.autologinUser = "nixos";

          ### golden/consoleFont.png
          systemd.tmpfiles.rules = [ ( import ./testPreparation.nix ).tmpfiles ];
        };
    };

    enableOcr  = false;

    testScript =
      ''
        ${testHelpers}
        start_all()
        ${testScriptExternal}
      '';

      name = self.inputs.latest.lib.toUpper name;
  };

  name = with builtins; baseNameOf (toString ./.);

  testScriptExternal = builtins.readFile ./testScript.py;

in
{
  ${name} = mkTest host test;
}
