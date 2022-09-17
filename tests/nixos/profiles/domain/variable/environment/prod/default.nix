{ self, mkTest, testHelpers, ... }:
let
  variantSpecifics  = rec {
    subDomainName = "";
    variant       = "prod";
    ports         = {
      http  = 30080;
      https = 30443;
    };
  };
  name   = with builtins; baseNameOf (toString ./.);
  shared = (import ../shared/test.nix { inherit mkTest name self testHelpers variantSpecifics; });
in
with shared;
{
  ${name} = mkTest host test;
}
