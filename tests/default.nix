{ self, inputs, digga, ... }:
let
  ### use modified mkTest based on digga
  ### TODO -> upstream changes
  lib = inputs.digga.inputs.nixlib.lib;
  mkTest = (import ../lib/testing { inherit lib; }).mkTest;
in
{
  integrationTests = digga.lib.eachDefaultSystem (system: {
    ### TODO register tests automatically with inputs.digga.lib.rakeLeaves
    test  = (import ./pythonTest { inherit              inputs system; });
    testy = (import ./test       { inherit self mkTest;                });
  });
}
