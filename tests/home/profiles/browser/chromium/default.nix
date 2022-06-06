{ mkTest
, self
, testHelpers
, ...
}:
let
  host     = self.nixosConfigurations.NixOS;
  username = host.config.variables.testing.user.name;

  test = {
    nodes = {
      machine = { suites, profiles, ... }:
      {
        imports = with profiles; [
        ];

        bud.localFlakeClone = "/home/${username}/DEVOS"; ### documentation relies on the location

        home-manager.users.${username} = { profiles, suites, ... }:
        {
          imports = [
            profiles.browser.chromium
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

  hmProfileDirectory   = host.config.home-manager.users.${username}.home.profileDirectory + "/bin";
  testScriptExternal = (import ./testScript.py.nix { inherit hmProfileDirectory; });

in
{
  ${name} = mkTest host test;
}
