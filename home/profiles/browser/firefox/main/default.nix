{ config
, nixosConfig
, pkgs
, variables
, ...
}:
let
  inherit (config.home)                         username homeDirectory;
  inherit (nixosConfig.users.users.${username}) group                 ;
in
{

  programs.firefox = {
    enable = true;
    profiles = {
      "${variables.users.${username}.abbreviation}" = {
        settings = {
          "browser.ctrlTab.recentlyUsedOrder" = false;            ### about:preferences#general::Tabs::"Ctrl+Tab cycles through tabs in recently used order"
          "browser.shell.checkDefaultBrowser" = false;            ### about:preferences#general::Startup::"Always check if Firefox is your default browser"
          "browser.startup.page"              = 3;                ### about:preferences#general::Startup::"Restore previous session"
          "font.name.monospace.x-western"     = "Noto Sans Mono"; ### about:preferences#general::Fonts and Colors::Advanced
          "font.name.sans-serif.x-western"    = "Noto Sans";      ### about:preferences#general::Fonts and Colors::Advanced
          "font.name.serif.x-western"         = "Noto Serif";     ### about:preferences#general::Fonts and Colors::Advanced
          "full-screen-api.ignore-widgets"    = true;             ### about:config; enable full-i3-container
          "extensions.autoDisableScopes"      = 0;                ### about:config; enable all extensions automatically; https://extensionworkshop.com/documentation/enterprise/enterprise-distribution/#firefox-settings
        };
      };
    };
    extensions = with pkgs.nur.repos.rycee.firefox-addons; [
      export-tabs-urls-and-titles
      metamask
      # octotree
      # rust-search-extension
      # stylus
      ublock-origin
      wappalyzer
      # tab-session-manager ### session no tabs or windows
    ];
  };
  ### TODO addons-keybindings: split with new addon-implementation
  ### needs to exist and be overrideable on switch
  systemd.user.tmpfiles.rules =
    [
      "L ${homeDirectory}/.mozilla/firefox/${variables.users.${username}.abbreviation}/extension-settings.json 644 ${username} ${group} ${./extension-settings.json}"
    ];
}


