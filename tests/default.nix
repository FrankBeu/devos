{ self }:

let
  lib          = self.inputs.digga.inputs.nixlib.lib;
  collectTests = (import ../lib/testing { inherit self lib; }).collectTests;

in collectTests ./.
