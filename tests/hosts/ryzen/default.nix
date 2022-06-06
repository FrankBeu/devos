{ mkTest
, self
, testHelpers
, ...
}:
let
  host          = self.nixosConfigurations.vmRyzen;
  hostVariables = host.config.variables;
  username      = hostVariables.testing.user.name;
  userID        = host.config.users.users.${username}.uid;
  hmProfileDir  = host.config.home-manager.users.${username}.home.profileDirectory + "/bin";

  ### NIXOS
  colorscheme  = builtins.readFile                ../../nixos/modules/colorscheme/testScript.py;
  variables    = (import                          ../../nixos/modules/variables/testScript.py.nix         { inherit username;     });

  consPreamble = builtins.readFile                ../../nixos/profiles/console/testScriptIntegrationPreamble.py;
  console      = consPreamble + builtins.readFile ../../nixos/profiles/console/testScript.py;
  vim          = builtins.readFile                ../../nixos/profiles/editor/vim/testScript.py;
  ranger       = builtins.readFile                ../../nixos/profiles/filemanager/ranger/testScript.py;
  timezone     = builtins.readFile                ../../nixos/profiles/timezone/amsterdam/testScript.py;

  docLocal     = (import                          ../../nixos/suites/docLocal/testScript.nix                                       ).testScript;
  i3           = (import                          ../../nixos/suites/i3/testScript.nix                    { inherit userID;       }).testScript;

  ### HOME
  chromium     = (import                          ../../home/profiles/browser/chromium/testScript.py.nix  { inherit hmProfileDir; });
  # emacs      = builtins.readFile                ../../home/profiles/editor/emacs/testScript.py;           ### TODO: needs hw-acceleration
  gitPreamble  = builtins.readFile                ../../home/profiles/git/testScriptIntegrationPreamble.py;
  git          = gitPreamble + builtins.readFile  ../../home/profiles/git/testScript.py;
  fcitx        = (import                          ../../home/profiles/i18n/fcitx/shared/testScript.py.nix { inherit username;     });



  test = {
    nodes = {
      machine = { suites, profiles, variables, colorscheme, ... }:
      {
        ### ARRANGE
        imports = with profiles; [
          # autologin.variable
          autologin.root
        ];

        variables = {
          currentColorSchemeName = "custom-base24-dracula"; ### always use the same colorscheme for tests (has to be aligned with NixOS)
        };

        systemd.tmpfiles.rules = [
          ### colorscheme: colorTest{Target,Actual}
          ( import ../../nixos/modules/colorscheme/testPreparation.nix { inherit colorscheme; }).tmpfiles
          ### variables: variablesTest{Target,Actual}
          ( import ../../nixos/modules/variables/testPreparation.nix   { inherit variables;   }).tmpfiles
          ### console: golden/consoleFontTarget.png
          ( import ../../nixos/profiles/console/testPreparation.nix                            ).tmpfiles
          ### console: golden/gitVersionTarget.png
          ( import ../../home/profiles/git/testPreparation.nix                                 ).tmpfiles
        ];

        home-manager.users.${username} = { profiles, suites, variables, ... }:
        {
          imports   = [];
          home.file = {
            ### variables: variablesTestActual
            "tmp/variablesTestActual".text = ( import ../../nixos/modules/variables/testPreparationHome.nix { inherit variables; } );
          };
        };
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

        ${chromium}
        # $${console} ### TODO reactivate after graphical
        ${vim}
        ${ranger}
        ${timezone}


        ${docLocal}
        ${i3}


        # $${git}     ### TODO reactivate after graphical
        # $${emacs}   ### TODO reactivate after graphical
        # $${fcitx}   ### TODO reactivate after graphical
      '';

      name = self.inputs.latest.lib.toUpper name;
  };

  name = with builtins; baseNameOf (toString ./.);

in
{
  ${name} = mkTest host test;
}
