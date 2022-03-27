{ self, mkTest, ...}:
let
  ### TODO set globaly to test with specific host
  host = self.nixosConfigurations.NixOS;

  test = {
    nodes = {
      machine =
        { suites, profiles, variables, colorscheme, ... }: {
          ### colorTest{Target,Actual}
          systemd.tmpfiles.rules = [ ( import ./testPreparation.nix { inherit colorscheme; } ).tmpfiles ];
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
