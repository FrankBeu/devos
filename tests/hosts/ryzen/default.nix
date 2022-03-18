{ self, mkTest, testHelpers, ...}:

let
  host = self.nixosConfigurations.ryzen;

  # meta.timeout = 1800;
  # meta.timeout = 50;


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
          variables = {
            currentColorSchemeName = "dracula"; ### always use same colorscheme for tests
          };
        };
    };

    enableOcr  = true;

    testScript =
      ''

      ${testHelpers}
      start_all()

      ${vim}
      ${ranger}
      ${timezone}

    '';

    # ${variables}
    # ${console}
    # ${colorscheme}

    name = self.inputs.latest.lib.toUpper name;
  };

  name = with builtins; baseNameOf (toString ./.);

in
{
  ${name} = mkTest host test;
}

### if "error: attribute 'system' missing" is thrown
### disable profile.bud in ../../../hosts/ryzen/system.nix
