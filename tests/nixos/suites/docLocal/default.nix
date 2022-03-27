{ self, mkTest, testHelpers, ... }:
let
  host = self.nixosConfigurations.NixOS;


  test = {
    nodes = {
      machine =
        { suites, profiles, ... }: {
          imports = [] ++ suites.docLocal;

          ### golden/consoleFont.png
          # systemd.tmpfiles.rules = [ ( import ./testPreparation.nix ).tmpfiles ];
        };
    };

    enableOCR  = false;

    testScript =
      ''
        ${testHelpers}
        start_all()
        machine.wait_for_unit("multi-user.target")
        ${testScriptExternal}
      '';

      name = self.inputs.latest.lib.toUpper name;
  };

  name = with builtins; baseNameOf (toString ./.);

  testScriptExternal = (import ./testScript.nix).testScript;

in
{
  ${name} = mkTest host test;
}
