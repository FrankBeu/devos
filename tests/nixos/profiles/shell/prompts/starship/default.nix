{ mkTest
, self
, testHelpers
, ...
}:
let
  host     = self.nixosConfigurations.test;
  username = host.config.variables.testing.user.name;

  test = {
    nodes = {
      machine = { suites, pkgs, profiles, variables, ... }:
      {
        imports = with profiles; [
          shell.prompts.starship
          shell.zsh
        ] ++
        # suites.debug ++
        [];
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

  version    = host.pkgs.sources.starship.version;
  testScriptExternal = (import ./testScript.py.nix { inherit version; });

in
{
  ${name} = mkTest host test;
}
