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
          editor.emacs
          # alacritty
          # ] ++ suites.i3;
        ];

        ### golden/gitVersionTarget.png
        # systemd.tmpfiles.rules = [ ( import ./testPreparation.nix ).tmpfiles ];

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
            editor.emacs
            # display.i3
            # alacritty
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

  testScriptNixos    = builtins.readFile "${self}/tests/nixos/profiles/editor/emacs/testScript.py";
  testScriptExternal = (import ./testScript.py.nix {inherit username;});

in
{
  ${name} = mkTest host test;
}
