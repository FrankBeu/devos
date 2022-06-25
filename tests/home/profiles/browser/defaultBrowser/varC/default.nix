{ self, mkTest, testHelpers, ... }:
let
  ### variantSpecific settings
  defaultBrowser = "chromium-browser";

  name   = with builtins; baseNameOf (toString ./.);
  shared = (import ../shared/test.nix {
    inherit mkTest name self testHelpers
    ### forward variantSpecific settings
    defaultBrowser
    ;});
in
with shared;
{
  ${name} = mkTest host test;
}
