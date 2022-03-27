{ self, mkTest, testHelpers, ... }:
let
  host = self.nixosConfigurations.NixOS;

  test = {

    nodes = {
      machine =
        { suites, profiles, ... }: {
          imports = with profiles; [ services.documentation ];

          services.getty.autologinUser = "nixos";

          ### golden/gitVersionTarget.png
          systemd.tmpfiles.rules = [ ( import ./testPreparation.nix ).tmpfiles ];

          home-manager.users.nixos = { profiles, suites, ... }: {
            imports = [
              profiles.git
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

  testScriptExternal = builtins.readFile ./testScript.py;

in
{
  ${name} = mkTest host test;
}
