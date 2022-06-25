let
  currentColorSchemeName = (import ./currentColorScheme.nix ).colorScheme;
in
{
  inherit currentColorSchemeName;

  abbreviation   = "tt";
  name           = "test";
  email          = "test@thesym.site";

  ### TODO remove and substitute in all dependents with solution in defaultBrowser
  # defaultBrowser = "chromium-browser";
  # defaultBrowser = "firefox";
}
