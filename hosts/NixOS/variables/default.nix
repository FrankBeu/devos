{ config, ... }:
let currentColorSchemeName = (import ./currentColorScheme.nix ).colorScheme;
in
{
  variables = {
    test  = "TEST";
    test2 = "TEST2";

    mainUser = "nixos";

    inherit currentColorSchemeName;
  };
}
