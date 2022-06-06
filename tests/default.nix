{ self }:

let
  lib          = self.inputs.digga.inputs.nixlib.lib;
  collectTests = (import ../lib/testing { inherit self lib; }).collectTests;

in collectTests ./.
### TODO use self.lib.testing.collectTests ./. (self.nixosConfiguration is not available??)
### TODO check self.lib.our.testing.collectTests
