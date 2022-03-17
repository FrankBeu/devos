{ self }:

let
  lib          = self.inputs.digga.inputs.nixlib.lib;
  collectTests = (import ../lib/testing { inherit self lib; }).collectTests;

in collectTests ./.
### TODO use self.lib.testing.collectTests ./. (self.nixosConfiguration is not available??)
### TODO documentation make testing.org available
