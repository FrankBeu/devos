{ mkTest
, self
, testHelpers
, ...
}:
let
  host     = self.nixosConfigurations.test;
  username = host.config.variables.testing.user.name;
  group    = host.config.users.users.${username}.group;

  test = {
    # extraPythonPackages = p: [];
    nodes = {
      machine = { suites, profiles, variables, ... }:
      {
        imports = with profiles; [
          services.documentation
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

        bud.localFlakeClone               = "/home/${username}/DEVOS"; ### documentation relies on the location
        variables.documentation.user.name = username;

        ### TODO remove the statement and the file if they are not needed. Cf. `man tmpfiles.d`

        home-manager.users.${username} = { profiles, suites, ... }:
        {
          imports = with profiles; [
            display.i3

            profiles.actionButton
          ];

        systemd.user.tmpfiles.rules = [ ( import ./testPreparation.nix { inherit group username; }).tmpfiles ];### KEEP (multiline-)string-import

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
