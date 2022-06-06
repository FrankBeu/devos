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
        ] ++ suites.gnome;

        variables = {
          displaymanager = {
            autologin = {
              enabled  = true;
              inherit username;
            };
          };
        };

        ### golden/gitVersionTarget.png
        # systemd.tmpfiles.rules = [ ( import ./testPreparation.nix ).tmpfiles ];

        # home-manager.users.${username} = { profiles, suites, ... }:
        # {
        #   imports = [
        #   ];
        # };
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

  userID = host.config.users.users.${host.config.variables.testing.user.name}.uid;
  testScriptExternal = (import ./testScript.nix { inherit userID;}).testScript;

in
{
  ${name} = mkTest host test;
}
