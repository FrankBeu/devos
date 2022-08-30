let
  currentColorSchemeName = (import ./currentColorScheme.nix ).colorScheme;
in
{
  inherit currentColorSchemeName;

  abbreviation   = "te";
  name           = "test";
  # email        = "";

  # defaultBrowser = "chromium-browser";
  defaultBrowser = "firefox";
}
