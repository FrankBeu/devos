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



  bud-nuke                      = (import                 ../../bud/nuke/testScript.py.nix                               {inherit        username;       });
  bud-prepvm                    = (import                 ../../bud/prepvm/testScript.py.nix                             {inherit budDir username;       });
  bud-template                  = (import                 ../../bud/template/testScript.py.nix                           {inherit budDir username;       });
  bud-testCreate                = (import                 ../../bud/testCreate/testScript.py.nix                         {inherit budDir;                });


  nixos-module-colorscheme      = readFile                ../../nixos/modules/colorscheme/testScript.py;
  nixos-module-variables        = (import                 ../../nixos/modules/variables/testScript.py.nix                { inherit       username;       });


  nixos-profile-bud             = (import                 ../../nixos/profiles/bud/testScript.py.nix                     { inherit       username;       });
  consPreamble                  = readFile                ../../nixos/profiles/console/testScriptIntegrationPreamble.py;
  nixos-profile-console         = consPreamble + readFile ../../nixos/profiles/console/testScript.py;
  nixos-profile-editor-vim      = readFile                ../../nixos/profiles/editor/vim/testScript.py;
  nixos-profile-imageCommon     = readFile                ../../nixos/profiles/image/common/testScript.py;
  nixos-profile-manualActions   = (import                 ../../nixos/profiles/manualActions/testScript.py.nix           { inherit group username;       });
  nixos-profile-ranger          = readFile                ../../nixos/profiles/filemanager/ranger/testScript.py;
  nixos-profile-timezone        = readFile                ../../nixos/profiles/timezone/amsterdam/testScript.py;
  nixos-profile-tools-android   = (import                 ../../nixos/profiles/tools/android/testScript.py.nix           { inherit userID;               });
  nixos-profile-tools-drawio    = readFile                ../../nixos/profiles/tools/drawio/testScript.py;
  nixos-profile-tools-gotask    = readFile                ../../nixos/profiles/tools/gotask/testScript.py;
  nixos-profile-tools-gpu       = readFile                ../../nixos/profiles/tools/gpu/testScript.py;
  nixos-profile-tools-gucharmap = readFile                ../../nixos/profiles/tools/gucharmap/testScript.py;
  nixos-profile-tools-less      = readFile                ../../nixos/profiles/tools/less/testScript.py;
  nixos-profile-tools-lsof      = readFile                ../../nixos/profiles/tools/lsof/testScript.py;
  nixos-profile-tools-network   = readFile                ../../nixos/profiles/tools/network/testScript.py;
  nixos-profile-tools-nixTools  = readFile                ../../nixos/profiles/tools/nixTools/testScript.py;
  nixos-profile-tools-parted    = readFile                ../../nixos/profiles/tools/parted/testScript.py;
  nixos-profile-tools-qalculate = readFile                ../../nixos/profiles/tools/qalculate/testScript.py;
  nixos-profile-tools-system    = readFile                ../../nixos/profiles/tools/system/testScript.py;
  nixos-profile-tools-usbutils  = readFile                ../../nixos/profiles/tools/usbutils/testScript.py;
  nixos-profile-tools-xorg      = readFile                ../../nixos/profiles/tools/xorg/testScript.py;
  nixos-profile-tools-zathura   = readFile                ../../nixos/profiles/tools/zathura/testScript.py;
  nixos-profile-video-vlc       = readFile                ../../nixos/profiles/video/vlc/testScript.py;
  nixos-profile-video-ytdl      = readFile                ../../nixos/profiles/video/youtubedownloader/testScript.py;
  nixos-profile-virt-docker     = (import                 ../../nixos/profiles/virtualisation/docker/testScript.py.nix   { inherit userID;               });


  nixos-suite-docLocal          = (import                 ../../nixos/suites/docLocal/testScript.nix                                                      ).testScript;
  nixos-suite-i3                = (import                 ../../nixos/suites/i3/testScript.nix                           { inherit userID;               }).testScript;
  nixos-suite-rustTools         = (import                 ../../nixos/suites/rustTools/testScript.nix                                                     ).testScript;
  nixos-suite-virtmanager       = (import                 ../../nixos/suites/virtmanager/testScript.nix                  { inherit userID;               }).testScript;


  home-profile-bat              = (import                 ../../home/profiles/bat/testScript.py.nix                      { inherit hmProfileDir username;});
  home-profile-chromium         = (import                 ../../home/profiles/browser/chromium/testScript.py.nix         { inherit hmProfileDir;         });
  home-profile-clipmenu         = (import                 ../../home/profiles/clipmenu/testScript.py.nix                 { inherit              username;});
  # home-profile-emacs          = readFile                ../../home/profiles/editor/emacs/testScript.py;                  ### TODO: needs hw-acceleration
  home-profile-fcitx            = (import                 ../../home/profiles/i18n/fcitx/shared/testScript.py.nix        { inherit              username;});
  home-profile-dotLocal         = (import                 ../../home/profiles/dotLocal/testScript.py.nix                 { inherit hmProfileDir username;});
  home-profile-exa              = (import                 ../../home/profiles/exa/testScript.py.nix                      { inherit hmProfileDir;         });
  home-profile-git              = (import                 ../../home/profiles/git/testScript.py.nix                      { inherit hmProfileDir username;});
  home-profile-manualActions    = (import                 ../../home/profiles/manualActions/testScript.py.nix            { inherit              username;});
  home-profile-stateVersion     = (import                 ../../home/profiles/stateVersion/testScript.py.nix             { inherit              username;});
  home-profile-ripgrep          = (import                 ../../home/profiles/ripgrep/testScript.py.nix                  { inherit              username;});
  home-profile-tools-nixTools   = (import                 ../../home/profiles/tools/nixTools/testScript.py.nix           { inherit              username;});


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
          ( import ../../nixos/profiles/bud/testPreparation.nix            { inherit budDir group self username; }).tmpfiles
          ( import ../../bud/nuke/testPreparation.nix                      { inherit budDir group self username; }).tmpfiles
          ( import ../../bud/prepvm/testPreparation.nix                    { inherit budDir group self username; }).tmpfiles
          ( import ../../bud/template/testPreparation.nix                  { inherit budDir group self username; }).tmpfiles
          ( import ../../bud/testCreate/testPreparation.nix                { inherit budDir group self username; }).tmpfiles

          ### colorscheme: colorTest{Target,Actual}
          ( import ../../nixos/modules/colorscheme/testPreparation.nix     { inherit colorscheme;                }).tmpfiles
          ### variables: variablesTest{Target,Actual}
          ( import ../../nixos/modules/variables/testPreparation.nix       { inherit variables;                  }).tmpfiles
          ### console: golden/consoleFontTarget.png
          ( import ../../nixos/profiles/console/testPreparation.nix                                               ).tmpfiles
          ### home-profiles-bat
          ( import ../../home/profiles/bat/testPreparation.nix             { inherit        group      username; }).tmpfiles
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

        ${nixos-profile-bud}
        ${bud-nuke}
        ${bud-prepvm}
        ${bud-template}
        ${bud-testCreate}


        ${nixos-module-colorscheme}
        ${nixos-module-variables}


        # $${nixos-profile-console}      ### TODO reactivate after graphical
        ${nixos-profile-editor-vim}
        ${nixos-profile-imageCommon}
        ${nixos-profile-manualActions}
        ${nixos-profile-ranger}
        ${nixos-profile-timezone}
        ${nixos-profile-tools-android}
        ${nixos-profile-tools-drawio}
        ${nixos-profile-tools-gotask}
        ${nixos-profile-tools-gpu}
        ${nixos-profile-tools-gucharmap}
        ${nixos-profile-tools-less}
        ${nixos-profile-tools-lsof}
        ${nixos-profile-tools-network}
        ${nixos-profile-tools-nixTools}
        ${nixos-profile-tools-parted}
        ${nixos-profile-tools-qalculate}
        ${nixos-profile-tools-system}
        ${nixos-profile-tools-usbutils}
        ${nixos-profile-tools-xorg}
        ${nixos-profile-tools-zathura}
        ${nixos-profile-video-vlc}
        ${nixos-profile-video-ytdl}
        ${nixos-profile-virt-docker}


        ${nixos-suite-docLocal}
        ${nixos-suite-i3}
        ${nixos-suite-rustTools}
        ${nixos-suite-virtmanager}


        ${home-profile-bat}
        ${home-profile-chromium}
        ${home-profile-clipmenu}
        ${home-profile-exa}
        ${home-profile-dotLocal}
        ${home-profile-manualActions}
        ${home-profile-ripgrep}
      '';
        # ${home-profile-git}
        # ${home-profile-emacs}          ### TODO reactivate after graphical
        # ${home-profile-fcitx}          ### TODO reactivate after graphical
        # ${home-profile-stateVersion}   ### TODO reactivate after nixos-option is fixed
        # ${home-profile-tools-nixTools} ### TODO reactivate after zsh
        ### all documentation tests seem to be unreliable reactivate after passthrough or other improvements

      name = self.inputs.latest.lib.toUpper name;
  };

  name = with builtins; baseNameOf (toString ./.);

in
{
  ${name} = mkTest host test;
}
