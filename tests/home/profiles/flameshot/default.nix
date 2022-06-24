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
      machine = { pkgs, profiles, suites, variables, ... }:
      {
        imports = with profiles; [
          alacritty
        ] ++
        suites.i3 ++
        # suites.debug ++
        [];

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
            directoryStructure
            display.i3
            flameshot
          ];
        };

        users.users.${username}.shell = pkgs.zsh; ### directoryStructure: shell has to be set in order to create aliases ### TODO required?? just create needed dir; in profile - is flameshot dependency anyway
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
