{ self, mkTest, ...}:
let
  host = self.nixosConfigurations.NixOS;

  test = {
    nodes = {
      machine =
        { suites, profiles, variables, ... }: {
          ### variablesTest{Target,Actual}
          systemd.tmpfiles.rules = [ ( import ./testPreparation.nix { inherit variables; } ).tmpfiles ];

          home-manager.users.nixos = { profiles, suites, variables, ... }: {
            imports = [];

            ### variablesTestActual
            home.file."tmp/variablesTestActual".text = ''
              ${variables.test}
              ${variables.currentColorSchemeName}
            '';
          };
        };
    };

    enableOCR  = false;

    testScript =
      ''
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
