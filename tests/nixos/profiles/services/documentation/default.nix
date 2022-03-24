{ self, mkTest, testHelpers, ... }:
let
  ################################################### TEST-CONFIG
  host = self.nixosConfigurations.NixOS;

  # meta.timeout = 1800;

  test = {
    nodes = {
      machine =
        { suites, profiles, ... }: {
          imports = [ profiles.services.documentation ];
        };
    };

    enableOcr  = false;
    ############################################### TEST-CONFIG-END

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
