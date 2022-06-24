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



  bud-nuke                             = (import                 ../../bud/nuke/testScript.py.nix                                 {inherit        username;       });
  bud-prepvm                           = (import                 ../../bud/prepvm/testScript.py.nix                               {inherit budDir username;       });
  bud-template                         = (import                 ../../bud/template/testScript.py.nix                             {inherit budDir username;       });
  bud-testCreate                       = (import                 ../../bud/testCreate/testScript.py.nix                           {inherit budDir;                });


  nixos-module-colorscheme             = readFile                ../../nixos/modules/colorscheme/testScript.py;
  nixos-module-variables               = (import                 ../../nixos/modules/variables/testScript.py.nix                  { inherit       username;       });


  nixos-profile-bud                    = (import                 ../../nixos/profiles/bud/testScript.py.nix                       { inherit       username;       });
  consPreamble                         = readFile                ../../nixos/profiles/console/testScriptIntegrationPreamble.py;
  nixos-profile-console                = consPreamble + readFile ../../nixos/profiles/console/testScript.py;
  nixos-profile-curSysPkgs             = readFile                ../../nixos/profiles/currentSystemPackages/testScript.py;
  nixos-profile-editor-vim             = readFile                ../../nixos/profiles/editor/vim/testScript.py;
  nixos-profile-imageCommon            = readFile                ../../nixos/profiles/image/common/testScript.py;
  nixos-profile-manualActions          = (import                 ../../nixos/profiles/manualActions/testScript.py.nix             { inherit group username;       });
  nixos-profile-ranger                 = readFile                ../../nixos/profiles/filemanager/ranger/testScript.py;
  nixos-profile-security-age           = readFile                ../../nixos/profiles/security/agebox/testScript.py;
  nixos-profile-services-ssh           = readFile                ../../nixos/profiles/services/ssh/testScript.py;
  nixos-profile-timezone               = readFile                ../../nixos/profiles/timezone/amsterdam/testScript.py;
  nixos-profile-tools-android          = (import                 ../../nixos/profiles/tools/android/testScript.py.nix             { inherit userID;               });
  nixos-profile-tools-drawio           = readFile                ../../nixos/profiles/tools/drawio/testScript.py;
  nixos-profile-tools-gotask           = readFile                ../../nixos/profiles/tools/gotask/testScript.py;
  nixos-profile-tools-gpu              = readFile                ../../nixos/profiles/tools/gpu/testScript.py;
  nixos-profile-tools-gucharmap        = readFile                ../../nixos/profiles/tools/gucharmap/testScript.py;
  nixos-profile-tools-less             = readFile                ../../nixos/profiles/tools/less/testScript.py;
  nixos-profile-tools-lsof             = readFile                ../../nixos/profiles/tools/lsof/testScript.py;
  nixos-profile-tools-network          = readFile                ../../nixos/profiles/tools/network/testScript.py;
  nixos-profile-tools-nixTools         = readFile                ../../nixos/profiles/tools/nixTools/testScript.py;
  nixos-profile-tools-parted           = readFile                ../../nixos/profiles/tools/parted/testScript.py;
  nixos-profile-tools-qalculate        = readFile                ../../nixos/profiles/tools/qalculate/testScript.py;
  nixos-profile-tools-system           = readFile                ../../nixos/profiles/tools/system/testScript.py;
  nixos-profile-tools-usbutils         = readFile                ../../nixos/profiles/tools/usbutils/testScript.py;
  nixos-profile-tools-xorg             = readFile                ../../nixos/profiles/tools/xorg/testScript.py;
  nixos-profile-tools-zip              = readFile                ../../nixos/profiles/tools/zip/testScript.py;
  nixos-profile-tools-zathura          = readFile                ../../nixos/profiles/tools/zathura/testScript.py;
  nixos-profile-video-vlc              = readFile                ../../nixos/profiles/video/vlc/testScript.py;
  nixos-profile-video-ytdl             = readFile                ../../nixos/profiles/video/youtubedownloader/testScript.py;
  nixos-profile-virt-docker            = (import                 ../../nixos/profiles/virtualisation/docker/testScript.py.nix     { inherit userID;               });


  nixos-suite-docLocal                 = (import                 ../../nixos/suites/docLocal/testScript.nix                                                      ).testScript;
  nixos-suite-i3                       = (import                 ../../nixos/suites/i3/testScript.nix                             { inherit userID;               }).testScript;
  nixos-suite-rustTools                = (import                 ../../nixos/suites/rustTools/testScript.nix                                                     ).testScript;
  nixos-suite-virtmanager              = (import                 ../../nixos/suites/virtmanager/testScript.nix                    { inherit userID;               }).testScript;


  home-profile-bat                     = (import                 ../../home/profiles/bat/testScript.py.nix                        { inherit hmProfileDir username;});
  home-profile-chromium                = (import                 ../../home/profiles/browser/chromium/testScript.py.nix           { inherit hmProfileDir;         });
  home-profile-display-cursor          = (import                 ../../home/profiles/display/cursor/testScript.py.nix             { inherit hmProfileDir username;});
  home-profile-firefox-main            = (import                 ../../home/profiles/browser/firefox/main/testScript.py.nix       { inherit hmProfileDir username;});
  home-profile-firefox-orgCapture      = (import                 ../../home/profiles/browser/firefox/orgCapture/testScript.py.nix { inherit              username;});
  home-profile-firefox-tridactyl       = (import                 ../../home/profiles/browser/firefox/tridactyl/testScript.py.nix  { inherit              username;});
  home-profile-clipmenu                = (import                 ../../home/profiles/clipmenu/testScript.py.nix                   { inherit              username;});
  # home-profile-emacs                 = readFile                ../../home/profiles/editor/emacs/testScript.py;                  ### TODO: needs hw-acceleration
  home-profile-fcitx                   = (import                 ../../home/profiles/i18n/fcitx/shared/testScript.py.nix          { inherit              username;});
  home-profile-directoryStructure      = (import                 ../../home/profiles/directoryStructure/testScript.py.nix         { inherit              username;});
  home-profile-dotLocal                = (import                 ../../home/profiles/dotLocal/testScript.py.nix                   { inherit hmProfileDir username;});
  home-profile-exa                     = (import                 ../../home/profiles/exa/testScript.py.nix                        { inherit hmProfileDir;         });
  home-profile-flameshot               = (import                 ../../home/profiles/flameshot/testScript.py.nix                  { inherit hmProfileDir username;});
  home-profile-git                     = (import                 ../../home/profiles/git/testScript.py.nix                        { inherit hmProfileDir username;});
  home-profile-languages-golang        = (import                 ../../home/profiles/languages/golang/testScript.py.nix           { inherit hmProfileDir username;});
  home-profile-manualActions           = (import                 ../../home/profiles/manualActions/testScript.py.nix              { inherit              username;});
  home-profile-notification-dunst      = (import                 ../../home/profiles/notification/dunst/testScript.py.nix         { inherit hmProfileDir username;});
  home-profile-stateVersion            = (import                 ../../home/profiles/stateVersion/testScript.py.nix               { inherit              username;});
  home-profile-ripgrep                 = (import                 ../../home/profiles/ripgrep/testScript.py.nix                    { inherit              username;});
  home-profile-rofi                    = (import                 ../../home/profiles/rofi/testScript.py.nix                       { inherit hmProfileDir username;});
  home-profile-security-age            = (import                 ../../home/profiles/security/age/testScript.py.nix               { inherit hmProfileDir username;});
  home-profile-security-gocryptfs      = (import                 ../../home/profiles/security/gocryptfs/testScript.py.nix         { inherit hmProfileDir username;});
  home-profile-security-gopass         = (import                 ../../home/profiles/security/gopass/testScript.py.nix            { inherit hmProfileDir username;});
  home-profile-security-sops           = (import                 ../../home/profiles/security/sops/testScript.py.nix              { inherit hmProfileDir username;});
  home-profile-security-ssh            = (import                 ../../home/profiles/security/ssh/testScript.py.nix               { inherit              username;});
  home-profile-security-summon         = (import                 ../../home/profiles/security/summon/testScript.py.nix            { inherit hmProfileDir username;});
  home-profile-shell-aliases           = (import                 ../../home/profiles/shell/aliases/testScript.py.nix              { inherit              username;});
  home-profile-shell-cod               = (import                 ../../home/profiles/shell/cod/testScript.py.nix                  { inherit              username;});
  home-profile-shell-fuzzy-fzf         = (import                 ../../home/profiles/shell/fuzzy/fzf/testScript.py.nix            { inherit hmProfileDir username;});
  home-profile-shell-nushell           = (import                 ../../home/profiles/shell/nushell/testScript.py.nix              { inherit hmProfileDir username;});
  home-profile-shell-snippets-pet      = (import                 ../../home/profiles/shell/snippets/pet/testScript.py.nix         { inherit hmProfileDir username;});
  home-profile-shell-vivid             = (import                 ../../home/profiles/shell/vivid/testScript.py.nix                { inherit hmProfileDir username;});
  home-profile-shell-zsh               = (import                 ../../home/profiles/shell/zsh/testScript.py.nix                  { inherit hmProfileDir username;});
  home-profile-tools-nixTools          = (import                 ../../home/profiles/tools/nixTools/testScript.py.nix             { inherit              username;});

  ### FUNDUS
  #home-profile-shell-fuzzy-skim       = (import                 ../../home/profiles/shell/fuzzy/skim/testScript.py.nix           { inherit hmProfileDir username;});

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
          ( import ../../nixos/profiles/bud/testPreparation.nix               { inherit budDir group self username; }).tmpfiles
          ( import ../../bud/nuke/testPreparation.nix                         { inherit budDir group self username; }).tmpfiles
          ( import ../../bud/prepvm/testPreparation.nix                       { inherit budDir group self username; }).tmpfiles
          ( import ../../bud/template/testPreparation.nix                     { inherit budDir group self username; }).tmpfiles
          ( import ../../bud/testCreate/testPreparation.nix                   { inherit budDir group self username; }).tmpfiles

          ### colorscheme: colorTest                                          {Target,Actual}
          ( import ../../nixos/modules/colorscheme/testPreparation.nix        { inherit colorscheme;                }).tmpfiles
          ### variables: variablesTest                                        {Target,Actual}
          ( import ../../nixos/modules/variables/testPreparation.nix          { inherit variables;                  }).tmpfiles
          ### console: golden/consoleFontTarget.png
          ( import ../../nixos/profiles/console/testPreparation.nix                                                  ).tmpfiles
          ( import ../../home/profiles/bat/testPreparation.nix                { inherit        group      username; }).tmpfiles
          ( import ../../home/profiles/notification/dunst/testPreparation.nix                                        ).tmpfiles
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


        ${nixos-profile-curSysPkgs}
        ${nixos-profile-editor-vim}
        ${nixos-profile-imageCommon}
        ${nixos-profile-manualActions}
        ${nixos-profile-ranger}
        ${nixos-profile-security-age}
        ${nixos-profile-services-ssh}
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
        ${nixos-profile-tools-zip}
        ${nixos-profile-video-vlc}
        ${nixos-profile-video-ytdl}
        ${nixos-profile-virt-docker}


        ${nixos-suite-docLocal}
        ${nixos-suite-i3}
        ${nixos-suite-rustTools}
        ${nixos-suite-virtmanager}


        ${home-profile-bat}
        ${home-profile-chromium}
        ${home-profile-display-cursor}
        ${home-profile-firefox-main}
        ${home-profile-firefox-orgCapture}
        ${home-profile-firefox-tridactyl}
        ${home-profile-clipmenu}
        ${home-profile-directoryStructure}
        ${home-profile-exa}
        ${home-profile-flameshot}
        ${home-profile-dotLocal}
        ${home-profile-languages-golang}
        ${home-profile-manualActions}
        ${home-profile-rofi}
        ${home-profile-ripgrep}
        ${home-profile-security-age}
        ${home-profile-security-gocryptfs}
        ${home-profile-security-gopass}
        ${home-profile-security-sops}
        ${home-profile-security-ssh}
        ${home-profile-security-summon}
        ${home-profile-shell-aliases}
        ${home-profile-shell-cod}
        ${home-profile-shell-fuzzy-fzf}
        ${home-profile-shell-nushell}
        ${home-profile-shell-snippets-pet}
        ${home-profile-shell-vivid}
        ${home-profile-shell-zsh}
      '';
        # ${nixos-profile-console}           ### TODO reactivate after graphical
        # ${home-profile-emacs}              ### TODO reactivate after graphical
        # ${home-profile-fcitx}              ### TODO reactivate after graphical
        # ${home-profile-git}                ### TODO reactivate after graphical
        # ${home-profile-notification-dunst} ### TODO reactivate after passthrough screenshots are different as on standalone because of different execution-duration
        # ${home-profile-stateVersion}       ### TODO reactivate after nixos-option is fixed
        # ${home-profile-tools-nixTools}     ### TODO reactivate after zsh
        ### all documentation tests seem to be unreliable reactivate after passthrough or other improvements

        ### FUNDUS
        # ${home-profile-shell-fuzzy-skim}
      name = self.inputs.latest.lib.toUpper name;
  };

  name = with builtins; baseNameOf (toString ./.);

in
{
  ${name} = mkTest host test;
}
