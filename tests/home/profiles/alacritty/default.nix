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
        imports = with profiles; [
        ];

        ### golden/gitVersionTarget.png
        # systemd.tmpfiles.rules = [ ( import ./testPreparation.nix ).tmpfiles ];

        home-manager.users.${username} = { profiles, suites, ... }:
        {
          imports = with profiles; [
            alacritty
          ];
        };
      };
    };

    enableOCR = true;

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
