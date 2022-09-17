{ self, mkTest, testHelpers, ... }:
let
  variantSpecifics  = rec {
    subDomainName = "stage";
    variant       = subDomainName;
    ports         = {
      http  = 31080;
      https = 31443;
    };
  };
  name   = with builtins; baseNameOf (toString ./.);
  shared = (import ../shared/test.nix { inherit mkTest name self testHelpers variantSpecifics; });
in
with shared;
{
  ${name} = mkTest host test;
}
