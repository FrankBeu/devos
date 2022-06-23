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
        ] ++
        # suites.debug ++
        [];

        bud.localFlakeClone = "/home/${username}/DEVOS"; ### documentation relies on the location

        users.users.${username}.shell = pkgs.zsh;

        home-manager.users.${username} = { profiles, suites, ... }:
        {
          imports = with profiles; [
            shell.zsh

            shell.aliases
          ];
        };
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

  testScriptExternal = (import ./testScript.py.nix {inherit username;});

in
{
  ${name} = mkTest host test;
}
