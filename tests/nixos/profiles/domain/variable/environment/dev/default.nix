{ self, mkTest, testHelpers, ... }:
let
  variantSpecifics  = rec {
    subDomainName = "dev";
    variant       = subDomainName;
    ports         = {
      http  = 32080;
      https = 32443;
    };
  };
  name   = with builtins; baseNameOf (toString ./.);
  shared = (import ../shared/test.nix { inherit mkTest name self testHelpers variantSpecifics; });
in
with shared;
{
  ${name} = mkTest host test;
}
