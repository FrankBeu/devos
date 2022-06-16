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
      machine = { suites, profiles, ... }:
      {
        # imports = [];
        imports = [] ++ suites.debug;

        home-manager.users.${username} = { profiles, suites, ... }:
        {
          imports = with profiles; [
            dotLocal
          ];
          # programs.zsh.enable = true; ### home.sessionPath is sourced by the shell ### TODO NOT WORKING either
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

  hmProfileDir       = host.config.home-manager.users.${username}.home.profileDirectory + "/bin";
  testScriptExternal = (import ./testScript.py.nix {inherit hmProfileDir username;});

in
{
  ${name} = mkTest host test;
}