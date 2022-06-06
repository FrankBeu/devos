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
          alacritty
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
        ${testScriptNixos}
        ${testScriptExternal}
      '';

      name = self.inputs.latest.lib.toUpper name;
  };

  name = with builtins; baseNameOf (toString ./.);

  testScriptNixos    = builtins.readFile ../../../nixos/profiles/alacritty/testScript.py;
  testScriptExternal = builtins.readFile ./testScript.py;

in
{
  ${name} = mkTest host test;
}
