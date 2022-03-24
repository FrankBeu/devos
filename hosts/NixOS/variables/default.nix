{ config, ... }:
let currentColorSchemeName = (import ./currentColorScheme.nix ).colorScheme;
in
{
  variables = {
    test  = "TEST";
    test2 = "TEST2";

    mainUser = {
      abbreviation   = "nixos";
      name           = "nixos";
      email          = "nixos@thesym.site";
      description    = "Nixos Testuser";
    };

    inherit currentColorSchemeName;
  };
}
