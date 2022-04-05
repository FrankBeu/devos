{ self, mkTest, testHelpers, ... }:
let
  host = self.nixosConfigurations.NixOS;

  test = {
    nodes = {
      machine =
        { suites, profiles, ... }: {
          imports = with profiles; [
            autologin.mainUser
            domain.server
            networking.nameserver.regular
            tools.network                  ### DEV
          ];
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

  name = with builtins; baseNameOf (toString ./.);

  testScriptExternal = builtins.readFile ./testScript.py;

in
{
  ${name} = mkTest host test;
}
