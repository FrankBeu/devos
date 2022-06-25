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
          shell.zsh
        ] ++
        # suites.debug ++
        suites.i3 ++
        [];

        users.users.${username}.shell = pkgs.zsh;

        variables = {
          displaymanager = {
            autologin = {
              enabled  = true;
              inherit username;
            };
          };
        };

        home-manager.users.${username} = { profiles, suites, ... }:
        {
          imports = with profiles; [
            alacritty
            shell.zsh
            stateVersion ### needed for the location of the zshHistoryFile
            display.i3
            ### TODO fonts

            shell.prompts.powerline
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

  hmProfileDir       = host.config.home-manager.users.${username}.home.profileDirectory;
  testScriptExternal = (import ./testScript.py.nix { inherit hmProfileDir username; });

in
{
  ${name} = mkTest host test;
}
