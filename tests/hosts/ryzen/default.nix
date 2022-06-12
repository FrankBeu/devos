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
  readFile      = builtins.readFile;

  ### NIXOS
  ### NIXOS-MODULES
  colorscheme     = readFile                ../../nixos/modules/colorscheme/testScript.py;
  variables       = (import                 ../../nixos/modules/variables/testScript.py.nix                { inherit username;     });

  ### NIXOS-PROFILES
  consPreamble    = readFile                ../../nixos/profiles/console/testScriptIntegrationPreamble.py;
  console         = consPreamble + readFile ../../nixos/profiles/console/testScript.py;
  editor-vim      = readFile                ../../nixos/profiles/editor/vim/testScript.py;
  imageCommon     = readFile                ../../nixos/profiles/image/common/testScript.py;
  ranger          = readFile                ../../nixos/profiles/filemanager/ranger/testScript.py;
  timezone        = readFile                ../../nixos/profiles/timezone/amsterdam/testScript.py;
  tools-parted    = readFile                ../../nixos/profiles/tools/parted/testScript.py;
  tools-qalculate = readFile                ../../nixos/profiles/tools/qalculate/testScript.py;
  tools-zathura   = readFile                ../../nixos/profiles/tools/zathura/testScript.py;
  virt-docker     = (import                 ../../nixos/profiles/virtualisation/docker/testScript.py.nix   { inherit userID;       });
  tools-gotask         = readFile                ../../nixos/profiles/tools/gotask/testScript.py;
  tools-gucharmap      = readFile                ../../nixos/profiles/tools/gucharmap/testScript.py;
  tools-less           = readFile                ../../nixos/profiles/tools/less/testScript.py;
  tools-lsof           = readFile                ../../nixos/profiles/tools/lsof/testScript.py;
  tools-network        = readFile                ../../nixos/profiles/tools/network/testScript.py;
  tools-nixTools       = readFile                ../../nixos/profiles/tools/nixTools/testScript.py;
  tools-system         = readFile                ../../nixos/profiles/tools/system/testScript.py;
  tools-usbutils       = readFile                ../../nixos/profiles/tools/usbutils/testScript.py;
  tools-vulkan         = readFile                ../../nixos/profiles/tools/vulkan/testScript.py;
  tools-xorg           = readFile                ../../nixos/profiles/tools/xorg/testScript.py;

  ### NIXOS-SUITES
  docLocal        = (import                 ../../nixos/suites/docLocal/testScript.nix                                              ).testScript;
  i3              = (import                 ../../nixos/suites/i3/testScript.nix                           { inherit userID;       }).testScript;
  rustTools       = (import                 ../../nixos/suites/rustTools/testScript.nix                                             ).testScript;
  virtmanager     = (import                 ../../nixos/suites/virtmanager/testScript.nix                  { inherit userID;       }).testScript;

  ### HOME
  ### HOME-PROFILES
  chromium        = (import                 ../../home/profiles/browser/chromium/testScript.py.nix         { inherit hmProfileDir; });
  # emacs         = builtins.readFile       ../../home/profiles/editor/emacs/testScript.py;                  ### TODO: needs hw-acceleration
  fcitx           = (import                 ../../home/profiles/i18n/fcitx/shared/testScript.py.nix        { inherit username;     });
  gitPreamble     = readFile                ../../home/profiles/git/testScriptIntegrationPreamble.py;
  git             = gitPreamble + readFile  ../../home/profiles/git/testScript.py;



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
          currentColorSchemeName = "custom-base24-dracula"; ### always use the same colorscheme for tests (has to be aligned with hosts/test)
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


        ### NIXOS-MODULES
        ${colorscheme}
        ${variables}


        ### NIXOS-PROFILES
        ${chromium}
        # $${console} ### TODO reactivate after graphical
        ${editor-vim}
        ${imageCommon}
        ${ranger}
        ${timezone}
        ${tools-gotask}
        ${tools-gucharmap}
        ${tools-less}
        ${tools-lsof}
        ${tools-network}
        ${tools-nixTools}
        ${tools-parted}
        ${tools-qalculate}
        ${tools-system}
        ${tools-usbutils}
        ${tools-vulkan}
        ${tools-xorg}
        ${tools-zathura}
        ${virt-docker}


        ### NIXOS-SUITES
        ${docLocal}
        ${i3}
        ${rustTools}
        ${virtmanager}


        ### HOME-PROFILES
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
