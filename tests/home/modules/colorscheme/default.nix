{ mkTest
, self
, ...
}:
let
  host     = self.nixosConfigurations.NixOS;
  username = host.config.variables.testing.user.name;

  test = {
    nodes = {
      machine = { suites, profiles, variables, ... }:
      {
        ### colorTest{Target,Actual}

        home-manager.users.${username} = { profiles, suites, variables, colorscheme, ... }:
        {
          imports = with profiles; [
          ];
          systemd.user.tmpfiles.rules = [ ( import ./testPreparation.nix { inherit colorscheme; } ).tmpfiles ];
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
