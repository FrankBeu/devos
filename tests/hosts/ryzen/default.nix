{ self, mkTest, testHelpers, ...}:

let
  host = self.nixosConfigurations.ryzen;

  colorscheme = builtins.readFile ../../nixos/modules/colorscheme/testScript.py;
  variables   = builtins.readFile ../../nixos/modules/variables/testScript.py;

  console     = builtins.readFile ../../nixos/profiles/console/testScript.py;
  vim         = builtins.readFile ../../nixos/profiles/editor/vim/testScript.py;
  ranger      = builtins.readFile ../../nixos/profiles/filemanager/ranger/testScript.py;
  timezone    = builtins.readFile ../../nixos/profiles/timezone/amsterdam/testScript.py;

  test = {
    nodes = {
      machine =
        { suites, profiles, variables, colorscheme, ... }: {
          ### ARRANGE
          variables = {
            currentColorSchemeName = "custom-base24-dracula"; ### always use the same colorscheme for tests (has to be aligned with NixOS)
          };

          systemd.tmpfiles.rules = [] ++
          ### colorTest{Target,Actual}
          ( import ../../nixos/modules/colorscheme/testPreparation.nix { inherit colorscheme; } ).tmpfiles ++
          ### variablesTest{Target,Actual}
          ( import ../../nixos/modules/variables/testPreparation.nix   { inherit variables;   } ).tmpfiles
          ;
        };
    };

    enableOcr  = true;

    ### ACT and ASSERT
    testScript =
      ''

      ${testHelpers}

      start_all()

      ${colorscheme}
      ${variables}

      ${vim}
      ${ranger}
      ${timezone}

    '';

    # ${console}

    name = self.inputs.latest.lib.toUpper name;
  };

  name = with builtins; baseNameOf (toString ./.);

in
{
  ${name} = mkTest host test;
}

### if "error: attribute 'system' missing" is thrown
### disable profile.bud in ../../../hosts/ryzen/system.nix
