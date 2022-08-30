{ config, ... }:
let currentColorSchemeName = (import ./currentColorScheme.nix ).colorScheme;
in
{
  variables = rec {
    autoLogin        = true;

    hostname         = "mac";

    mainUser = {
      abbreviation   = "fb";
      name           = "frank";
      email          = "frank@thesym.site";
      description    = "Frank Beutelschiess";
      # defaultBrowser = "chromium-browser";
      defaultBrowser = "firefox";
    };

    inherit currentColorSchemeName;
  };
}
