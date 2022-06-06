let
  currentColorSchemeName = (import ./currentColorScheme.nix ).colorScheme;
in
{
  inherit currentColorSchemeName;

  abbreviation   = "tt";
  name           = "test";
  email          = "test@thesym.site";

  defaultBrowser = "chromium-browser";
}
