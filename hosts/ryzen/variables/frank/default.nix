let
  currentColorSchemeName = (import ./currentColorScheme.nix ).colorScheme;
in
{
  inherit currentColorSchemeName;

  abbreviation   = "fb";
  name           = "frank";
  email          = "fbeutelschiess@gmail.com";

  defaultBrowser = "chromium-browser";
  # defaultBrowser = "firefox";
}

