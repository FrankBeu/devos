{ self, mkTest, testHelpers, ...}:

let
  host = self.nixosConfigurations.ryzen;

  colorscheme  = builtins.readFile ../../nixos/modules/colorscheme/testScript.py;
  variables    = builtins.readFile ../../nixos/modules/variables/testScript.py;
  consPreamble = builtins.readFile ../../nixos/profiles/console/testScriptIntegrationPreamble.py;
  console      = consPreamble + builtins.readFile ../../nixos/profiles/console/testScript.py;
  vim          = builtins.readFile ../../nixos/profiles/editor/vim/testScript.py;
  ranger       = builtins.readFile ../../nixos/profiles/filemanager/ranger/testScript.py;
  timezone     = builtins.readFile ../../nixos/profiles/timezone/amsterdam/testScript.py;

  docLocal     = (import ../../nixos/suites/docLocal/testScript.nix).testScript;

  test = {
    nodes = {
      machine =
        { suites, profiles, variables, colorscheme, ... }: {
          ### ARRANGE

          services.getty.autologinUser                         = "root";
          # services.xserver.displayManager.gdm.autoLogin.user   = "root";
          # services.xserver.displayManager.gdm.autoLogin.enable = true;

          variables = {
            currentColorSchemeName = "custom-base24-dracula"; ### always use the same colorscheme for tests (has to be aligned with NixOS)
          };

          systemd.tmpfiles.rules = [
            ### colorscheme: colorTest{Target,Actual}
            ( import ../../nixos/modules/colorscheme/testPreparation.nix { inherit colorscheme; } ).tmpfiles
            ### variables: variablesTest{Target,Actual}
            ( import ../../nixos/modules/variables/testPreparation.nix   { inherit variables;   } ).tmpfiles
            ### console: golden/consoleFont.png
            ( import ../../nixos/profiles/console/testPreparation.nix                             ).tmpfiles
          ];
        };
    };

    enableOCR  = true;

    ### ACT and ASSERT
    testScript =
      ''
        ${testHelpers}

        start_all()

        ${colorscheme}
        ${variables}

        ${console}
        ${vim}
        ${ranger}
        ${timezone}

        ${docLocal}

      '';

      name = self.inputs.latest.lib.toUpper name;
  };

  name = with builtins; baseNameOf (toString ./.);

in
{
  ${name} = mkTest host test;
}

### if "error: attribute 'system' missing" is thrown
### disable profile.bud in ../../../hosts/ryzen/system.nix
