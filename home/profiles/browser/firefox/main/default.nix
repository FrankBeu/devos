{ config
, pkgs
, variables
, ...
}:
let
  inherit (config.home) username;
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
          "full-screen-api.ignore-widgets"    = true;             ### enable full-i3-container
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
}
