{ config, ... }:
let currentColorSchemeName = (import ./currentColorScheme.nix ).colorScheme;
in
{
  variables = rec {
    autoLogin        = true;

    ### TODO dryOut / transfer as much as possible to users/frank
    mainUser = {
      abbreviation   = "fb";
      name           = "frank";
      email          = "frank@thesym.site";
      description    = "Frank Beutelschiess";
      # defaultBrowser = "chromium-browser";
      defaultBrowser = "firefox";
      group          = "users";
    };

    inherit currentColorSchemeName;

    test  = "TEST";
  };
}
