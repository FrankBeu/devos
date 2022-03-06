{ self, lib }:
let
  loadColorScheme =
    customSchemes: nixColorSchemes: currentColorSchemeName:
    let scheme = if lib.hasPrefix "custom-" currentColorSchemeName then customSchemes else nixColorSchemes;
    in (builtins.getAttr currentColorSchemeName scheme);
in
### TODO unit-test
{ inherit loadColorScheme; }
