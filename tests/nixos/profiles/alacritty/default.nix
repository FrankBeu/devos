{ self, mkTest, testHelpers, ... }:
let
  host = self.nixosConfigurations.NixOS;

  test = {
    nodes = {
      machine =
        # { suites, profiles, ... }: {
          { suites, profiles, pkgs, ... }: {
            imports = with profiles; [
              alacritty
            ];
          };
    };

    enableOCR  = true;

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
