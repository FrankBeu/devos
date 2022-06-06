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
      machine = { suites, profiles, variables, ... }:
      {
        imports = with profiles; [
          services.documentation
          autologin.variable
        ];

        bud.localFlakeClone               = "/home/${username}/DEVOS"; ### documentation relies on the location
        variables.documentation.user.name = username;

        ### golden/gitVersionTarget.png
        systemd.tmpfiles.rules = [ ( import ./testPreparation.nix ).tmpfiles ];

        home-manager.users.${username} = { profiles, suites, ... }:
        {
          imports = [
            profiles.git
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

  testScriptExternal = builtins.readFile ./testScript.py;

in
{
  ${name} = mkTest host test;
}
