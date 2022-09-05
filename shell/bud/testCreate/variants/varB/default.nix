{ self, mkTest, testHelpers, ... }:
let
  variantSpecifics  = {
    variant = "varB";
    ### TODO variantSpecific settings
  };

  name   = with builtins; baseNameOf (toString ./.);
  shared = (import ../shared/test.nix { inherit mkTest name self testHelpers variantSpecifics; });
in
with shared;
{
  ${name} = mkTest host test;
}
