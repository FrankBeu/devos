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
  group         = host.config.users.users.${username}.group;
  hmProfileDir  = host.config.home-manager.users.${username}.home.profileDirectory + "/bin";
  readFile      = builtins.readFile;
  budDir        = hostVariables.budLocalFlakeCloneLocation;

  ### BUD
  bud-nuke             = (import                 ../../bud/nuke/testScript.py.nix                               {inherit        username;       });
  bud-prepvm           = (import                 ../../bud/prepvm/testScript.py.nix                             {inherit budDir username;       });
  bud-template         = (import                 ../../bud/template/testScript.py.nix                           {inherit budDir username;       });
  bud-testCreate       = (import                 ../../bud/testCreate/testScript.py.nix                         {inherit budDir;                });

  ### NIXOS
  ### NIXOS-MODULES
  colorscheme          = readFile                ../../nixos/modules/colorscheme/testScript.py;
  variables            = (import                 ../../nixos/modules/variables/testScript.py.nix                { inherit       username;       });

  ### NIXOS-PROFILES
  bud                  = (import                 ../../nixos/profiles/bud/testScript.py.nix                     { inherit       username;       });
  consPreamble         = readFile                ../../nixos/profiles/console/testScriptIntegrationPreamble.py;
  console              = consPreamble + readFile ../../nixos/profiles/console/testScript.py;
  editor-vim           = readFile                ../../nixos/profiles/editor/vim/testScript.py;
  imageCommon          = readFile                ../../nixos/profiles/image/common/testScript.py;
  ranger               = readFile                ../../nixos/profiles/filemanager/ranger/testScript.py;
  timezone             = readFile                ../../nixos/profiles/timezone/amsterdam/testScript.py;
  tools-android        = (import                 ../../nixos/profiles/tools/android/testScript.py.nix           { inherit userID;               });
  tools-drawio         = readFile                ../../nixos/profiles/tools/drawio/testScript.py;
  tools-gotask         = readFile                ../../nixos/profiles/tools/gotask/testScript.py;
  tools-gucharmap      = readFile                ../../nixos/profiles/tools/gucharmap/testScript.py;
  tools-less           = readFile                ../../nixos/profiles/tools/less/testScript.py;
  tools-lsof           = readFile                ../../nixos/profiles/tools/lsof/testScript.py;
  tools-network        = readFile                ../../nixos/profiles/tools/network/testScript.py;
  tools-nixTools       = readFile                ../../nixos/profiles/tools/nixTools/testScript.py;
  tools-parted         = readFile                ../../nixos/profiles/tools/parted/testScript.py;
  tools-qalculate      = readFile                ../../nixos/profiles/tools/qalculate/testScript.py;
  tools-system         = readFile                ../../nixos/profiles/tools/system/testScript.py;
  tools-usbutils       = readFile                ../../nixos/profiles/tools/usbutils/testScript.py;
  tools-vulkan         = readFile                ../../nixos/profiles/tools/vulkan/testScript.py;
  tools-xorg           = readFile                ../../nixos/profiles/tools/xorg/testScript.py;
  tools-zathura        = readFile                ../../nixos/profiles/tools/zathura/testScript.py;
  video-vlc            = readFile                ../../nixos/profiles/video/vlc/testScript.py;
  video-ytdl           = readFile                ../../nixos/profiles/video/youtubedownloader/testScript.py;
  virt-docker          = (import                 ../../nixos/profiles/virtualisation/docker/testScript.py.nix   { inherit userID;               });

  ### NIXOS-SUITES
  docLocal             = (import                 ../../nixos/suites/docLocal/testScript.nix                                                      ).testScript;
  i3                   = (import                 ../../nixos/suites/i3/testScript.nix                           { inherit userID;               }).testScript;
  rustTools            = (import                 ../../nixos/suites/rustTools/testScript.nix                                                     ).testScript;
  virtmanager          = (import                 ../../nixos/suites/virtmanager/testScript.nix                  { inherit userID;               }).testScript;

  ### HOME
  ### HOME-PROFILES
  chromium             = (import                 ../../home/profiles/browser/chromium/testScript.py.nix         { inherit hmProfileDir;         });
  clipmenu             = (import                 ../../home/profiles/clipmenu/testScript.py.nix                 { inherit              username;});
  # emacs              = builtins.readFile       ../../home/profiles/editor/emacs/testScript.py;                  ### TODO: needs hw-acceleration
  fcitx                = (import                 ../../home/profiles/i18n/fcitx/shared/testScript.py.nix        { inherit              username;});
  dotLocal             = (import                 ../../home/profiles/dotLocal/testScript.py.nix                 { inherit hmProfileDir username;});
  exa                  = (import                 ../../home/profiles/exa/testScript.py.nix                      { inherit hmProfileDir;         });
  git                  = (import                 ../../home/profiles/git/testScript.py.nix                      { inherit hmProfileDir username;});
  stateVersion         = (import                 ../../home/profiles/stateVersion/testScript.py.nix             { inherit              username;});
  ripgrep              = (import                 ../../home/profiles/ripgrep/testScript.py.nix                  { inherit              username;});


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
          ### bud: home/${username}/DEVOS
          ( import ../../nixos/profiles/bud/testPreparation.nix        { inherit budDir group self username; }).tmpfiles
          ( import ../../bud/nuke/testPreparation.nix                  { inherit budDir group self username; }).tmpfiles
          ( import ../../bud/prepvm/testPreparation.nix                { inherit budDir group self username; }).tmpfiles
          ( import ../../bud/template/testPreparation.nix              { inherit budDir group self username; }).tmpfiles
          ( import ../../bud/testCreate/testPreparation.nix            { inherit budDir group self username; }).tmpfiles

          ### colorscheme: colorTest{Target,Actual}
          ( import ../../nixos/modules/colorscheme/testPreparation.nix { inherit colorscheme;                }).tmpfiles
          ### variables: variablesTest{Target,Actual}
          ( import ../../nixos/modules/variables/testPreparation.nix   { inherit variables;                  }).tmpfiles
          ### console: golden/consoleFontTarget.png
          ( import ../../nixos/profiles/console/testPreparation.nix                                           ).tmpfiles
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

        ### BUD
        ${bud} ### NIXOS-PROFILE
        ${bud-nuke}
        ${bud-prepvm}
        ${bud-template}
        ${bud-testCreate}

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
        ${tools-android}
        ${tools-drawio}
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
        ${video-vlc}
        ${video-ytdl}
        ${virt-docker}


        ### NIXOS-SUITES
        ${docLocal}
        ${i3}
        ${rustTools}
        ${virtmanager}


        ### HOME-PROFILES
        ${chromium}
        ${clipmenu}
        ${exa}
        ${git}
        ${dotLocal}
        ${ripgrep}
      '';
        # ${nixTools}
        # $${emacs}       ### TODO reactivate after graphical
        # $${fcitx}       ### TODO reactivate after graphical
        # ${stateVersion} ### TODO reactivate after nixos-option is fixed

      name = self.inputs.latest.lib.toUpper name;
  };

  name = with builtins; baseNameOf (toString ./.);

in
{
  ${name} = mkTest host test;
}
