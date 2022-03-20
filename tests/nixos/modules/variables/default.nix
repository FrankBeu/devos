{ self, mkTest, ...}:
let
  host = self.nixosConfigurations.NixOS;

  test = {
    nodes = {
      machine =
        { suites, profiles, variables, ... }: {
          ### variablesTest{Target,Actual}
          systemd.tmpfiles.rules = [ ( import ./testPreparation.nix { inherit variables; } ).tmpfiles ];
        };
    };

    enableOcr  = false;

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
