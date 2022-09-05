{ mkTest
, self
, testHelpers
, ...
}:
let
  host           = self.nixosConfigurations.vmRyzen;
  hostVariables  = host.config.variables;
  username       = hostVariables.testing.user.name;
  userID         = host.config.users.users.${username}.uid;
  group          = host.config.users.users.${username}.group;
  hmProfileDir   = host.config.home-manager.users.${username}.home.profileDirectory;
  readFile       = builtins.readFile;
  budDir         = hostVariables.budLocalFlakeCloneLocation;
  defaultBrowser = hostVariables.users.${username}.defaultBrowser;


  ### nixos.profiles.domain.variable
  ### TODO create module
  domainVariableDEV   = rec {port = 32080; variant =   "dev"; subDomain =   "dev.${hostVariables.domain}";};
  domainVariableSTAGE = rec {port = 31080; variant = "stage"; subDomain = "stage.${hostVariables.domain}";};
  # domainVariablePROD  = rec {port = 30080; variant =  "prod"; subDomain =       "${hostVariables.domain}";};


  ### TODO call directly in test: only one statment to handle
  bud-nuke                                = (import                 ../../bud/nuke/testScript.py.nix                                    {inherit        username;       });
  bud-prepvm                              = (import                 ../../bud/prepvm/testScript.py.nix                                  {inherit budDir username;       });
  bud-template                            = (import                 ../../bud/template/testScript.py.nix                                {inherit budDir username;       });
  bud-testCreate                          = (import                 ../../bud/testCreate/testScript.py.nix                              {inherit budDir;                });


  nixos-modules-colorscheme               = readFile                ../../nixos/modules/colorscheme/testScript.py;
  nixos-modules-variables                 = (import                 ../../nixos/modules/variables/testScript.py.nix                     { inherit       username;       });


  nixos-profiles-bud                      = (import                 ../../nixos/profiles/bud/testScript.py.nix                          { inherit       username;       });
  consPreamble                            = readFile                ../../nixos/profiles/console/testScriptIntegrationPreamble.py;
  nixos-profiles-console                  = consPreamble + readFile ../../nixos/profiles/console/testScript.py;
  nixos-profiles-curSysPkgs               = readFile                ../../nixos/profiles/currentSystemPackages/testScript.py;
  nixos-profiles-editor-vim               = readFile                ../../nixos/profiles/editor/vim/testScript.py;
  nixos-profiles-fonts                    = readFile                ../../nixos/profiles/fonts/testScript.py;
  nixos-profiles-imageCommon              = readFile                ../../nixos/profiles/image/common/testScript.py;
  nixos-profiles-manualActions            = (import                 ../../nixos/profiles/manualActions/testScript.py.nix                { inherit group username;       });
  nixos-profiles-ranger                   = readFile                ../../nixos/profiles/filemanager/ranger/testScript.py;
  nixos-profiles-security-age             = readFile                ../../nixos/profiles/security/agebox/testScript.py;
  nixos-profiles-security-sopsNix         = (import                 ../../nixos/profiles/security/sopsNix/testScript.py.nix             { inherit              username;});
  nixos-profiles-services-ssh             = readFile                ../../nixos/profiles/services/ssh/testScript.py;
  nixos-profiles-shell-prompts-starship   = (import                 ../../nixos/profiles/shell/prompts/starship/testScript.py.nix       { inherit (host.pkgs.sources.starship) version; });
  nixos-profiles-sound-pipewire           = (import                 ../../nixos/profiles/sound/pipewire/testScript.py.nix               { inherit              username;});
  nixos-profiles-systemd-sleepDisable     = (import                 ../../nixos/profiles/systemd/sleepDisable/testScript.py.nix         { inherit hmProfileDir username;});
  nixos-profiles-timezone                 = readFile                ../../nixos/profiles/timezone/amsterdam/testScript.py;
  nixos-profiles-tools-android            = (import                 ../../nixos/profiles/tools/android/testScript.py.nix                { inherit userID;               });
  nixos-profiles-tools-archive            = readFile                ../../nixos/profiles/tools/archive/testScript.py;
  nixos-profiles-tools-drawio             = readFile                ../../nixos/profiles/tools/drawio/testScript.py;
  nixos-profiles-tools-gotask             = readFile                ../../nixos/profiles/tools/gotask/testScript.py;
  nixos-profiles-tools-gpu                = readFile                ../../nixos/profiles/tools/gpu/testScript.py;
  nixos-profiles-tools-gucharmap          = readFile                ../../nixos/profiles/tools/gucharmap/testScript.py;
  nixos-profiles-tools-inkscape           = (import                 ../../nixos/profiles/tools/inkscape/testScript.py.nix               {});
  nixos-profiles-tools-less               = readFile                ../../nixos/profiles/tools/less/testScript.py;
  nixos-profiles-tools-lsof               = readFile                ../../nixos/profiles/tools/lsof/testScript.py;
  nixos-profiles-tools-network            = readFile                ../../nixos/profiles/tools/network/testScript.py;
  nixos-profiles-tools-nixTools           = readFile                ../../nixos/profiles/tools/nixTools/testScript.py;
  nixos-profiles-tools-parted             = readFile                ../../nixos/profiles/tools/parted/testScript.py;
  nixos-profiles-tools-pdf                = readFile                ../../nixos/profiles/tools/pdf/testScript.py;
  nixos-profiles-tools-qalculate          = readFile                ../../nixos/profiles/tools/qalculate/testScript.py;
  nixos-profiles-tools-revealjs           = (import                 ../../nixos/profiles/tools/revealjs/testScript.py.nix               {});
  nixos-profiles-tools-system             = readFile                ../../nixos/profiles/tools/system/testScript.py;
  nixos-profiles-tools-usbutils           = readFile                ../../nixos/profiles/tools/usbutils/testScript.py;
  nixos-profiles-tools-xorg               = readFile                ../../nixos/profiles/tools/xorg/testScript.py;
  nixos-profiles-tools-zip                = readFile                ../../nixos/profiles/tools/zip/testScript.py;
  nixos-profiles-tools-zathura            = readFile                ../../nixos/profiles/tools/zathura/testScript.py;
  nixos-profiles-video-vlc                = readFile                ../../nixos/profiles/video/vlc/testScript.py;
  nixos-profiles-video-ytdl               = readFile                ../../nixos/profiles/video/youtubedownloader/testScript.py;
  nixos-profiles-virt-docker              = (import                 ../../nixos/profiles/virtualisation/docker/testScript.py.nix        { inherit userID               ;});


  nixos-suites-docLocal                   = (import                 ../../nixos/suites/docLocal/testScript.nix                                                           ).testScript;
  nixos-suites-i3                         = (import                 ../../nixos/suites/i3/testScript.nix                                { inherit userID               ;}).testScript;
  nixos-suites-rustTools                  = (import                 ../../nixos/suites/rustTools/testScript.nix                                                          ).testScript;
  nixos-suites-virtmanager                = (import                 ../../nixos/suites/virtmanager/testScript.nix                       { inherit userID               ;}).testScript;


  home-modules-services-backup-kopia      = (import                 ../../home/modules/services/backup/kopia/testScript.py.nix          { inherit              username;});


  home-profiles-alacritty                 = (import                 ../../home/profiles/alacritty/testScript.py.nix                     { inherit hmProfileDir username;});
  home-profiles-bat                       = (import                 ../../home/profiles/bat/testScript.py.nix                           { inherit hmProfileDir username;});
  home-profiles-backup-kopia              = (import                 ../../home/profiles/backup/kopia/testScript.py.nix                  { inherit hmProfileDir username;});
  home-profiles-chromium                  = (import                 ../../home/profiles/browser/chromium/testScript.py.nix              { inherit hmProfileDir         ;});
  home-profiles-browser-defaultBrowser    = (import                 ../../home/profiles/browser/defaultBrowser/shared/testScript.py.nix { inherit defaultBrowser username;});
  home-profiles-display-cursor            = (import                 ../../home/profiles/display/cursor/testScript.py.nix                { inherit hmProfileDir username;});
  home-profiles-firefox-main              = (import                 ../../home/profiles/browser/firefox/main/testScript.py.nix          { inherit hmProfileDir username;});
  home-profiles-firefox-orgCapture        = (import                 ../../home/profiles/browser/firefox/orgCapture/testScript.py.nix    { inherit              username;});
  home-profiles-firefox-tridactyl         = (import                 ../../home/profiles/browser/firefox/tridactyl/testScript.py.nix     { inherit              username;});
  home-profiles-clipmenu                  = (import                 ../../home/profiles/clipmenu/testScript.py.nix                      { inherit              username;});
  # home-profiles-emacs                   = readFile                ../../home/profiles/editor/emacs/testScript.py;                     ### TODO: needs hw-acceleration
  home-profiles-fcitx                     = (import                 ../../home/profiles/i18n/fcitx/shared/testScript.py.nix             { inherit              username;});
  home-profiles-directoryStructure        = (import                 ../../home/profiles/directoryStructure/testScript.py.nix            { inherit              username;});
  home-profiles-docDotLocal               = (import                 ../../home/profiles/docDotLocal/testScript.py.nix                   { inherit              username;});
  home-profiles-dotLocal                  = (import                 ../../home/profiles/dotLocal/testScript.py.nix                      { inherit hmProfileDir username;});
  home-profiles-exa                       = (import                 ../../home/profiles/exa/testScript.py.nix                           { inherit hmProfileDir         ;});
  home-profiles-flameshot                 = (import                 ../../home/profiles/flameshot/testScript.py.nix                     { inherit hmProfileDir username;});
  home-profiles-git                       = (import                 ../../home/profiles/git/testScript.py.nix                           { inherit hmProfileDir username;});
  home-profiles-languages-golang          = (import                 ../../home/profiles/languages/golang/testScript.py.nix              { inherit hmProfileDir username;});
  home-profiles-manualActions             = (import                 ../../home/profiles/manualActions/testScript.py.nix                 { inherit              username;});
  home-profiles-notification-dunst        = (import                 ../../home/profiles/notification/dunst/testScript.py.nix            { inherit hmProfileDir username;});
  home-profiles-stateVersion              = (import                 ../../home/profiles/stateVersion/testScript.py.nix                  { inherit              username;});
  home-profiles-ripgrep                   = (import                 ../../home/profiles/ripgrep/testScript.py.nix                       { inherit              username;});
  home-profiles-rofi                      = (import                 ../../home/profiles/rofi/testScript.py.nix                          { inherit hmProfileDir username;});
  home-profiles-security-age              = (import                 ../../home/profiles/security/age/testScript.py.nix                  { inherit hmProfileDir username;});
  home-profiles-security-gocryptfs        = (import                 ../../home/profiles/security/gocryptfs/testScript.py.nix            { inherit hmProfileDir username;});
  home-profiles-security-gopass           = (import                 ../../home/profiles/security/gopass/testScript.py.nix               { inherit hmProfileDir username;});
  home-profiles-security-sops             = (import                 ../../home/profiles/security/sops/testScript.py.nix                 { inherit hmProfileDir username;});
  home-profiles-security-ssh              = (import                 ../../home/profiles/security/ssh/testScript.py.nix                  { inherit              username;});
  home-profiles-security-summon           = (import                 ../../home/profiles/security/summon/testScript.py.nix               { inherit hmProfileDir username;});
  # home-profiles-shell-aliases           = (import                 ../../home/profiles/shell/aliases/testScript.py.nix                 { inherit              username;});### home.suites.zsh
  # home-profiles-shell-cod               = (import                 ../../home/profiles/shell/cod/testScript.py.nix                     { inherit hmProfileDir username;});### home.suites.zsh
  # home-profiles-shell-fuzzy-fzf         = (import                 ../../home/profiles/shell/fuzzy/fzf/testScript.py.nix               { inherit hmProfileDir username;});### home.suites.zsh
  home-profiles-shell-nushell             = (import                 ../../home/profiles/shell/nushell/testScript.py.nix                 { inherit hmProfileDir username;});
  # home-profiles-shell-snippets-pet      = (import                 ../../home/profiles/shell/snippets/pet/testScript.py.nix            { inherit hmProfileDir username;});### home.suites.zsh
  # home-profiles-shell-vivid             = (import                 ../../home/profiles/shell/vivid/testScript.py.nix                   { inherit hmProfileDir username;});### home.suites.zsh
  # home-profiles-shell-zsh               = (import                 ../../home/profiles/shell/zsh/testScript.py.nix                     { inherit hmProfileDir username;});### home.suites.zsh
  home-profiles-tools-nixTools            = (import                 ../../home/profiles/tools/nixTools/testScript.py.nix                { inherit              username;});
  home-profiles-tools-sound               = (import                 ../../home/profiles/tools/sound/testScript.py.nix                   { inherit hmProfileDir username;});
  home-profiles-xdg                       = (import                 ../../home/profiles/xdg/testScript.py.nix                           { inherit              username;});


  home-suites-zsh                         = (import                 ../../home/suites/zsh/testScript.nix                                { inherit hmProfileDir username;}).testScript;

  ### FUNDUS
  #nixos-profiles-shell-prompts-powerline = (import                 ../../nixos/profiles/shell/prompts/powerline/testScript.py.nix      {                               });
  #home-profiles-shell-fuzzy-skim         = (import                 ../../home/profiles/shell/fuzzy/skim/testScript.py.nix              { inherit hmProfileDir username;});



  test = {
    nodes = {
      machine = { suites, profiles, variables, colorscheme, ... }:
      {
        ### ARRANGE
        imports = with profiles; [
          # autologin.variable
          autologin.root

          ### preparationScripts
          ../../nixos/profiles/security/sopsNix/testPreparation.nix
          ### TODO check if all systemd.tmpfiles can also be just imported -> check host~ and standalone~tests

          ### nixos.profiles.domain.variable create testserver as long as the kube is without declarative setup
          (import  ../../nixos/profiles/domain/variable/shared/testService {inherit inputs pkgs self; inherit (domainVariableDEV)   port variant;})
          (import  ../../nixos/profiles/domain/variable/shared/testService {inherit inputs pkgs self; inherit (domainVariableSTAGE) port variant;})
          # (import  ../../nixos/profiles/domain/variable/shared/testService {inherit inputs pkgs self; inherit (domainVariablePROD)  port variant;})

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

        ${nixos-profiles-bud}
        ${bud-nuke}
        ${bud-prepvm}
        ${bud-template}
        ${bud-testCreate}


        ${nixos-modules-colorscheme}

        ${(import ../../nixos/profiles/k8s/base/testScript.py.nix  { inherit username;})}
        ${(import ../../nixos/profiles/k8s/cdk8s/testScript.py.nix { inherit username;})}
        ${(import ../../nixos/profiles/k8s/gui/testScript.py.nix   { inherit username;})}
        ${(import ../../nixos/profiles/k8s/k3d/testScript.py.nix   { inherit username;})}
        ${(import ../../nixos/profiles/k8s/k3s/testScript.py.nix   { inherit username;})}
        ${nixos-modules-variables}


        ${nixos-profiles-curSysPkgs}
        ${(import ../../nixos/profiles/domain/variable/shared/testScript.py.nix { inherit (domainVariableDEV)   port subDomain variant; })}     ### DEV
        ${(import ../../nixos/profiles/domain/variable/shared/testScript.py.nix { inherit (domainVariableSTAGE) port subDomain variant; })}     ### STAGE
        # ''${(import ../../nixos/profiles/domain/variable/shared/testScript.py.nix { inherit (domainVariablePROD)  port subDomain variant; })} ### PROD
        ${nixos-profiles-editor-vim}
        ${nixos-profiles-fonts}
        ${nixos-profiles-imageCommon}
        ${nixos-profiles-manualActions}
        ${nixos-profiles-ranger}
        ${nixos-profiles-security-age}
        ${nixos-profiles-security-sopsNix}
        ${nixos-profiles-services-ssh}
        ${nixos-profiles-sound-pipewire}
        ${nixos-profiles-systemd-sleepDisable}
        ${nixos-profiles-timezone}
        ${nixos-profiles-tools-android}
        ${nixos-profiles-tools-archive}
        ${nixos-profiles-tools-drawio}
        ${nixos-profiles-tools-gotask}
        ${nixos-profiles-tools-gpu}
        ${nixos-profiles-tools-gucharmap}
        ${nixos-profiles-tools-inkscape}
        ${nixos-profiles-tools-less}
        ${nixos-profiles-tools-lsof}
        ${nixos-profiles-tools-network}
        ${nixos-profiles-tools-nixTools}
        ${nixos-profiles-tools-parted}
        ${nixos-profiles-tools-pdf}
        ${nixos-profiles-tools-qalculate}
        ${nixos-profiles-tools-revealjs}
        ${nixos-profiles-tools-system}
        ${nixos-profiles-tools-usbutils}
        ${nixos-profiles-tools-xorg}
        ${nixos-profiles-tools-zathura}
        ${nixos-profiles-tools-zip}
        ${nixos-profiles-video-vlc}
        ${nixos-profiles-video-ytdl}
        ${nixos-profiles-virt-docker}


        ${nixos-suites-docLocal}
        ${nixos-suites-i3}
        ${nixos-suites-rustTools}
        ${nixos-suites-virtmanager}


        ${home-profiles-alacritty}
        ${home-profiles-bat}
        ${home-profiles-backup-kopia}
        ${home-profiles-chromium}
        ${home-profiles-browser-defaultBrowser}
        ${home-profiles-display-cursor}
        ${home-profiles-firefox-main}
        ${home-profiles-firefox-orgCapture}
        ${home-profiles-firefox-tridactyl}
        ${home-profiles-clipmenu}
        ${home-profiles-directoryStructure}
        ${home-profiles-docDotLocal}
        ${home-profiles-dotLocal}
        ${home-profiles-exa}
        ${home-profiles-flameshot}
        ${(import ../../home/profiles/k8s/pulumi/testScript.py.nix { inherit hmProfileDir;})}
        ${home-profiles-languages-golang}
        ${home-profiles-manualActions}
        ${home-profiles-rofi}
        ${home-profiles-ripgrep}
        ${home-profiles-security-age}
        ${home-profiles-security-gocryptfs}
        ${home-profiles-security-gopass}
        ${home-profiles-security-sops}
        ${home-profiles-security-ssh}
        ${home-profiles-security-summon}
        ${home-profiles-shell-nushell}
        ${home-profiles-tools-sound}
        ${home-profiles-xdg}


        ${home-suites-zsh}
      '';
        # ${home-modules-services-backup-kopia} ### TODO implement  after passthrough

        # ${nixos-profiles-console}             ### TODO reactivate after graphical
        # ${home-profiles-emacs}                ### TODO reactivate after graphical
        # ${home-profiles-fcitx}                ### TODO reactivate after graphical
        # ${home-profiles-git}                  ### TODO reactivate after graphical
        # ${home-profiles-notification-dunst}   ### TODO reactivate after passthrough screenshots are different as on standalone because of different execution-duration
        # ${home-profiles-stateVersion}         ### TODO reactivate after nixos-option is fixed
        # ${home-profiles-tools-nixTools}       ### TODO reactivate after zsh
        ### all documentation tests seem to be unreliable reactivate after passthrough or other improvements

        ### FUNDUS
        # ${home-profiles-shell-fuzzy-skim}
        # ${home-profiles-shell-prompts-starship}

        ### instead of ${home-suites-zsh}
        # ${home-profiles-shell-aliases}
        # ${home-profiles-shell-cod}
        # ${home-profiles-shell-fuzzy-fzf}
        # ${home-profiles-shell-prompts-powerline}
        # ${home-profiles-shell-snippets-pet}
        # ${home-profiles-shell-vivid}
        # ${home-profiles-shell-zsh}


      name = self.inputs.latest.lib.toUpper name;
  };

  name = with builtins; baseNameOf (toString ./.);

in
{
  ${name} = mkTest host test;
}
