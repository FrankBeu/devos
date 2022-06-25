{ self, mkTest, testHelpers, ... }:
let
  ### TODO variantSpecific settings

  name   = with builtins; baseNameOf (toString ./.);
  shared = (import ../shared/test.nix {
    inherit mkTest name self testHelpers
    ### TODO forward variantSpecific settings
    ;});
in
with shared;
{
  ${name} = mkTest host test;
}
