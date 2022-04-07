{ self, mkTest, testHelpers, ... }:
let
  host = self.nixosConfigurations.NixOS;

  test = {

    nodes = {
      machine =
        { suites, profiles, ... }: {
          imports = with profiles; [
            ### TODO
          ] ++ suites.i3;

          variables = {
            autoLogin = true;
          };

          ### golden/gitVersionTarget.png
          # systemd.tmpfiles.rules = [ ( import ./testPreparation.nix ).tmpfiles ];

          # home-manager.users.nixos = { profiles, suites, ... }: {
          #   imports = [
          #     ### TODO
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

  userID = host.config.users.users.${host.config.variables.mainUser.name}.uid;
  testScriptExternal = (import ./testScript.nix { inherit userID;}).testScript;

in
{
  ${name} = mkTest host test;
}
