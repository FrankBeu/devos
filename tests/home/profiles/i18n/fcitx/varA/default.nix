{ self, mkTest, testHelpers, ... }:
let
  colorSchemeName = "custom-base24-espresso";

  testPreparationPath = ./testPreparation.nix;

  name   = with builtins; baseNameOf (toString ./.);
  shared = (import ../shared/test.nix { inherit self mkTest testHelpers name colorSchemeName testPreparationPath; });
in
with shared;
{
  ${name} = mkTest host test;
}
