{ config, variables , ... }:
let
  inherit (config.home) username;
  defaultBrowser = variables.users.${username}.defaultBrowser;
in
{
  home.sessionVariables = {
    BROWSER         = defaultBrowser; ### TODO REMOVE
    DEFAULT_BROWSER = defaultBrowser; ### dependency for electron
  };

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "text/html"                     = "${defaultBrowser}.desktop";
      "x-scheme-handler/http"         = "${defaultBrowser}.desktop";
      "x-scheme-handler/https"        = "${defaultBrowser}.desktop";
      "x-scheme-handler/about"        = "${defaultBrowser}.desktop";
      "x-scheme-handler/unknown"      = "${defaultBrowser}.desktop";
    };
  };
}
