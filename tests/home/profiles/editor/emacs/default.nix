{ self, mkTest, testHelpers, ... }:
let
  host = self.nixosConfigurations.NixOS;

  test = {

    nodes = {
      machine =
        { suites, profiles, ... }: {
          imports = with profiles; [
            editor.emacs
            # alacritty
          # ] ++ suites.i3;
          ];

          ### golden/gitVersionTarget.png
          # systemd.tmpfiles.rules = [ ( import ./testPreparation.nix ).tmpfiles ];

          variables.autoLogin = true;

          home-manager.users.nixos = { profiles, suites, ... }: {
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

  username = host.config.variables.mainUser.name;

  testScriptNixos    = builtins.readFile "${self}/tests/nixos/profiles/editor/emacs/testScript.py";
  testScriptExternal = (import ./testScript.py.nix {inherit username;});

in
{
  ${name} = mkTest host test;
}
