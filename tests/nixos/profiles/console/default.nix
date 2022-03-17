{ self, mkTest, testHelpers, ... }:
let
  host = self.nixosConfigurations.NixOS;

  test = {
    nodes = {
      machine =
        { suites, profiles, ... }: {
          imports = [ profiles.console ];
          services.getty.autologinUser = "nixos";
        };
    };

    enableOcr  = false;

    testScript =
      ''
        ${testHelpers}
        start_all()
        ${testPreparation}
        ${testScriptExternal}
      '';

      name = self.inputs.latest.lib.toUpper name;
  };

  name = with builtins; baseNameOf (toString ./.);

  testPreparation    = (import ./testPreparation.nix).testPreparation;
  testScriptExternal = builtins.readFile ./testScript.py;

in
{
  ${name} = mkTest host test;
}
