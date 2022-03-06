{ config, ... }:
let currentColorSchemeName = (import ./currentColorScheme.nix );
in
{
  variables = {
    test  = "TEST";
    test2 = "TEST2";

    inherit currentColorSchemeName;
  };
}
