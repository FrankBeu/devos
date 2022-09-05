{ self, mkTest, testHelpers, ... }:
let
  variantSpecifics  = rec {
    subDomainName = "dev";
    variant       = subDomainName;
    port          = 32080;
  };
  name   = with builtins; baseNameOf (toString ./.);
  shared = (import ../shared/test.nix { inherit mkTest name self testHelpers variantSpecifics; });
in
with shared;
{
  ${name} = mkTest host test;
}
