{ self, mkTest, ...}:
let
  host = self.nixosConfigurations.NixOS;

  test = {
    nodes = {
      machine =
        { suites, profiles, ... }: {
          imports = [ profiles.timezone.amsterdam ];
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
  testHelpers = builtins.readFile ../../../../aux.py; ### TODO import globally

in
{
  ${name} = mkTest host test;
}
