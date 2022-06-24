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
    nodes = {
      machine = { suites, profiles, variables, ... }:
      {
        imports = with profiles; [
          bat
          services.documentation
        ] ++
        # suites.debug ++
        [];

        bud.localFlakeClone               = "/home/${username}/DEVOS"; ### documentation relies on the location
        variables.documentation.user.name = username;

        systemd.tmpfiles.rules = [ ( import ./testPreparation.nix { inherit group username; } ).tmpfiles ]; /* KEEP (multiline-)string-import */

        home-manager.users.${username} = { profiles, suites, ... }:
        {
          imports = with profiles; [
            bat
          ];
        };
      };
    };

    enableOCR  = false;

    testScript =
      ''
        ${testHelpers}
        start_all()
        ${testScriptNixos}
        ${testScriptExternal}
      '';

      name = self.inputs.latest.lib.toUpper name;
  };

  name = with builtins; baseNameOf (toString ./.);

  testScriptNixos    = builtins.readFile "${self}/tests/nixos/profiles/bat/testScript.py";
  hmProfileDir       = host.config.home-manager.users.${username}.home.profileDirectory;
  testScriptExternal = (import ./testScript.py.nix { inherit hmProfileDir username; });

in
{
  ${name} = mkTest host test;
}
